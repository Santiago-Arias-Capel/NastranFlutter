function cfg = NastranPreProc(inputFilePath)
%NASTRANPREPROC Entry point for the Nastran pre-processing toolbox.
%
%   CFG = NASTRANPREPROC(INPUTFILEPATH) adds the local Tools folder to the
%   MATLAB path and dispatches execution to NastranPreProcRun.

    if nargin < 1 || isempty(inputFilePath)
        error('NastranPreProc:MissingInput', ...
            'Usage: NastranPreProc(''path\\to\\NastranInput.inp'').');
    end

    thisFile = mfilename('fullpath');
    rootDir = fileparts(thisFile);
    toolsDir = fullfile(rootDir, 'Tools');

    if ~isfolder(toolsDir)
        error('NastranPreProc:MissingToolsFolder', ...
            'Tools folder not found: %s', toolsDir);
    end

    addpath(toolsDir, '-begin');
    rehash;
    cfg = NastranPreProcRun(inputFilePath);
end
