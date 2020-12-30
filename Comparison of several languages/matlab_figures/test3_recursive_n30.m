%--------------------------------------------------------------------------
%
%% FIGURE PLOT
%
%--------------------------------------------------------------------------
% Description:
% Several data files are loaded, compared, plotted, and printed in figure files.
%
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
% INITIAL PARAMETERS
%--------------------------------------------------------------------------
clear           ;
close all       ;
close all hidden;
fclose('all')   ;
format long     ;
tic             ;
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
% FILE'S NAME TO SAVE
%--------------------------------------------------------------------------
SIMPATH.savefile = '../Figures/3rd_recursive_n30';
FIGOPT.figformat = 'pdf'; % Save figure to specific file format: pdf, png, jpeg
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
% FILE`S PATH SETUP
%--------------------------------------------------------------------------
n = 1;
SIMPATH.file(n).path = '../Data/3rd_recursive_n30.txt'; n=n+1; % Diretorio para acessar
SIMPATH.file(n).path = '../Data/3rd_recursive_n30.txt'; n=n+1; % Diretorio para acessar
SIMPATH.file(n).path = '../Data/3rd_recursive_n30.txt'; n=n+1; % Diretorio para acessar
SIMPATH.file(n).path = '../Data/3rd_recursive_n30.txt'; n=n+1; % Diretorio para acessar
SIMPATH.file(n).path = '../Data/3rd_recursive_n30.txt'; n=n+1; % Diretorio para acessar

%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
% DATA SETUP
%--------------------------------------------------------------------------
n = 1;
SIMPATH.file(n).line2plot = [1]; n=n+1; % Columns to be ploted for file 1
SIMPATH.file(n).line2plot = [2]; n=n+1; % Columns to be ploted for file 2
SIMPATH.file(n).line2plot = [3]; n=n+1; % Columns to be ploted for file 2
SIMPATH.file(n).line2plot = [4]; n=n+1; % Columns to be ploted for file 2
SIMPATH.file(n).line2plot = [5]; n=n+1; % Columns to be ploted for file 2
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
% Figure limits
%--------------------------------------------------------------------------
FIGOPT.xlim = [0 0];
FIGOPT.ylim = [0 0];
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
% TITLES AND LABELS
%--------------------------------------------------------------------------
FIGOPT.labelx = 'Programming Language';
FIGOPT.labely = 'Execution time (s)';

n = 1;
FIGOPT.file(n).legend = 'Matlab'        ; n=n+1;
FIGOPT.file(n).legend = 'Python'        ; n=n+1;
FIGOPT.file(n).legend = 'Python - JIT'  ; n=n+1;
FIGOPT.file(n).legend = 'Fortran'       ; n=n+1;
FIGOPT.file(n).legend = 'Julia'         ; n=n+1;
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
%% LOAD DATA FILES
%--------------------------------------------------------------------------
nplot = max(size(SIMPATH.file));

for n=1:nplot
    disp(['      -> load_data - file',num2str(n),' - start']);

    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    % Checando se pasta raiz existe
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    if ~exist(SIMPATH.file(n).path,'file')
        error(['This folder can not be found:' , SIMPATH.file(n).path])
    end
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    % Load options
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    delimiterIn = ';';
    headersize  = 0;
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    % Importing file
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    aux_data                     = importdata(SIMPATH.file(n).path,delimiterIn,headersize);
    CFDDATA.file(n).exec_time = aux_data(SIMPATH.file(n).line2plot, :)';
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    disp(['      -> load_data - file ',num2str(n),' - end']);

end
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
%% DATA CONFIG AND CALCULATION
%--------------------------------------------------------------------------
for n=1:nplot
     CFDDATA.file(n).exec_time_ave = mean(CFDDATA.file(n).exec_time);
     CFDDATA.file(n).exec_time_std = std(CFDDATA.file(n).exec_time);
end
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
%% FIGURE PLOT
%--------------------------------------------------------------------------

for n=1:nplot
    time2plot(n) = CFDDATA.file(n).exec_time_ave;
    std2plot(n)  = CFDDATA.file(n).exec_time_std;
    name2plot{n} = FIGOPT.file(n).legend;
end

disp('      -> plot_data - start');
hFigure = figure;

% Plot the temperatures on a horizontal bar chart
bar(1:nplot,time2plot,'FaceColor','black');
hold on
%errorbar(1:nplot,time2plot,std2plot,std2plot);

% Change the Y axis tick labels to use the months
set(gca, 'XTick', 1:nplot)
set(gca, 'XTickLabel', name2plot)
xtickangle(45)

TEMPFILE.hXLabel     = xlabel(FIGOPT.labelx) ;
TEMPFILE.hYLabel     = ylabel(FIGOPT.labely) ;

set(gca                             , ...
    'YScale'        , 'linear'      , ...
    'fontsize'      , 30            , ...
    'YGrid'         , 'off'       	, ...
    'XGrid'         , 'off'       	, ...
    'FontName'      , 'Helvetica'   , ...
    'Box'           , 'on'        	, ...
    'linewidth'     , 1             , ...
    'TickDir'       , 'in'          , ...
    'XMinorTick'    , 'on'        	, ...
    'YMinorTick'    , 'on'        	, ...
    'XColor'        , [0 0 0]     	, ...
    'YColor'        , [0 0 0]     	);

set([TEMPFILE.hXLabel,TEMPFILE.hYLabel], ...
    'FontName'       , 'Helvetica'    , ...
    'FontSize'       , 30             );

set(gcf,...
    'PaperUnits'    , 'inches'         	,...
    'PaperPosition' , [0 0 15.0 9.75]  	,...
    'PaperSize'     ,[15.0 9.5]         );

disp('      -> plot_data - end');
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
%% SAVE FIGS
%--------------------------------------------------------------------------
disp('      -> save_fig - start');
saveas(hFigure,SIMPATH.savefile,FIGOPT.figformat)
disp('      -> save_fig - end');
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
%% EXITING CODE
%--------------------------------------------------------------------------
clear           ;
toc             ;
%--------------------------------------------------------------------------

