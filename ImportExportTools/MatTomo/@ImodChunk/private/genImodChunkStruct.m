%genImodChunkStruct  Generate a default ImodChunk structure
%
%   imodChunk = genImodChunkStruct
%
%   imodChunk   The ImodChunk object structure.
%
%   Bugs: none known
%
% This file is part of PEET (Particle Estimation for Electron Tomography).
% Copyright 2000-2020 The Regents of the University of Colorado.
% See PEETCopyright.txt for more details.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  $Author: John Heumann $
%
%  $Date: 2020/01/02 23:33:44 $
%
%  $Revision: ce44cef00aca $
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function imodChunk = genImodChunkStruct
imodChunk.ID = 0;
imodChunk.nBytes = 0;
imodChunk.bytes = [];
