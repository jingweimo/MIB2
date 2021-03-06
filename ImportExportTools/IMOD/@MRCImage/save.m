%save           Save the MRCImage object
%
%   mRCImage = save(mRCImage, newFilename);
%
%   mRCImage    The MRCImage object
%
%   newFilename OPTIONAL: Change the filename associated with this object and
%               save it to the new filename.
%
%   Bugs: none known
%
% This file is part of PEET (Particle Estimation for Electron Tomography).
% Copyright 2000-2012 The Regents of the University of Colorado & BLD3EMC:
%           The Boulder Laboratory For 3D Electron Microscopy of Cells.
% See PEETCopyright.txt for more details.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  $Author: John Heumann $
%
%  $Date: 2012/06/26 17:04:12 $
%
%  $Revision: 8ebca3b313c1 $
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function mRCImage = save(mRCImage, newFilename)

%  FIXME: update logic
if nargin > 1
  mRCImage = close(mRCImage);
  mRCImage.filename = newFilename;
  % Check to see if the file exists
  result = dir(mRCImage.filename);
  if size(result, 1) > 0
    if result.isdir
      PEETError('%s is a directory!', newFilename);
    else
      % if the file exists it needs to move out of the way
      delete(mRCImage.filename);
    end
  end
end

% Write out the header
mRCImage = writeHeader(mRCImage);

% Write out the volume if it is not already on the disk
if mRCImage.flgVolume
  modeStr = getModeString(mRCImage);
  if strcmp(modeStr, 'int16*2') || strcmp(modeStr, 'float32*2')
    modeStr = modeStr(1 : end - 2);
    flgComplex = true;
  else
    flgComplex = false;
  end

  nElements = numel(mRCImage.volume);
  
  if mRCImage.header.mode == 0 && getWriteBytesAsSigned(mRCImage)
    % Volume is represented internally as unsigned (0..255).
    % Reorder to preserve correct ordering if interpreted as signed, and
    % re-write the header (with shifted density statistics).
    topHalf = mRCImage.volume >= 128;
    mRCImage.volume(topHalf) = mRCImage.volume(topHalf) - 128;
    mRCImage.volume(~topHalf) = mRCImage.volume(~topHalf) + 128;
    mRCImage.header.minDensity = mRCImage.header.minDensity - 128;
    mRCImage.header.maxDensity = mRCImage.header.maxDensity - 128;
    mRCImage.header.meanDensity = mRCImage.header.meanDensity - 128;
    mRCImage = writeHeader(mRCImage);
  end
  
  % Handle writing complex arrays when requested  
  if flgComplex
    nX = mRCImage.header.nX;
    nY = mRCImage.header.nY;
    nZ = mRCImage.header.nZ;
    if modeStr(1) == 'i'
      temp = int16(zeros(2*nX, nY, nZ));
    else
      temp = single(zeros(2*nX, nY, nZ));
    end
    temp(1:2:2*nX-1, :, :) = real(mRCImage.volume);
    temp(2:2:2*nX, :, :) = imag(mRCImage.volume);
    count = fwrite(mRCImage.fid, temp, modeStr);
    if count ~= 2 * nElements
      fprintf('Matrix contains %d but only wrote %d elements\n', ...
              nElements, count / 2);
      PEETError('Failed writing matrix!');
    end
  else % normal (not complex) data
    count = fwrite(mRCImage.fid, mRCImage.volume, modeStr);
    if count ~= nElements
      fprintf('Matrix contains %d but only wrote %d elements\n', ...
              nElements, count);
      PEETError('Failed writing matrix!');
    end
  end
end
close(mRCImage);
