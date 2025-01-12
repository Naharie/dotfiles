{ pkgs
, lib
, config
, ...
}:

with lib;

let

  cfg = config.programs.fsearch;
  maintainers = import ../../lib/maintainers.nix;
  iniFormat = pkgs.formats.ini {};

  columnType = types.enum [ "Name" "Path" "Type" "Extension" "Size" "Modified" ];

  mkColumn = { name, visible, width }: mkOption {
    type = types.submodule ({ ... }: {
      options = {
        visible = mkOption {
          type = types.bool;
          default = visible;
          description = "Show the ${name} column.";
        };
        width = mkOption {
          type = types.int;
          default = width;
          description = "The width of the ${name} column.";
        };
      };
    });
    default = { inherit visible width; };
    description = "Configuration for the ${name} column.";
  };
in

{
  meta.maintainers = [ maintainers.naharie ];

  options.programs.fsearch = {
    enable = mkEnableOption "fsearch, a fast indexing file search solution";
    package = mkPackageOption pkgs "fsearch" {};

    interface = mkOption {
      type = types.submodule ({ ... }: {
        options = {
          singleClickOpen = mkOption {
            type = types.bool;
            default = false;
            description = "Open files and folders with a single click.";
          };
          launchDesktopFiles = mkOption {
            type = types.bool;
            default = true;
            description = "Run .desktop files instead of opening them as text documents.";
          };
          highlightSearchTerms = mkOption {
            type = types.bool;
            default = true;
            description = "Highlight matching parts of a file's name or path.";
          };
          persist = mkOption {
            type = types.submodule ({ ... }: {
              options = {
                columnConfiguration = mkOption {
                  type = types.bool;
                  default = true;
                  description = "Persist the column configuration across restarts.";
                };
                sortOrder = mkOption {
                  type = types.bool;
                  default = true;
                  description = "Persist the sort order across restarts.";
                };
                windowSize = mkOption {
                  type = types.bool;
                  default = false;
                  description = "Persist window size across restarts.";
                };
              };
            });
            default = {};
            description = "How changes are persisted across restarts.";
          };

          doubleClickPath = mkOption {
            type = types.bool;
            default = true;
            description = "Open path with double click on the path column.";
          };
          theme = mkOption {
            type = types.enum [ "light" "dark" ];
            default = "light";
            description = "The active interface color theme.";
          };

          show = mkOption {
            type = types.submodule ({ ... }: {
              options = {
                menuBar = mkOption {
                  type = types.bool;
                  default = true;
                  description = "Show the main menu bar.";
                };
                statusBar = mkOption {
                  type = types.bool;
                  default = cfg.interface.show.indexingStatus;
                  description = "Show the status bar.";
                };
                filters = mkOption {
                  type = types.bool;
                  default = true;
                  description = "Show a dropdown containing the configured filters.";
                };
                searchButton = mkOption {
                  type = types.bool;
                  default = false;
                  description = "Open files and folders with a single click.";
                };
                indexingStatus = mkOption {
                  type = types.bool;
                  default = true;
                  description = "Show the database indexing status in the statusbar.";
                };
                listviewIcons = mkOption {
                  type = types.bool;
                  default = true;
                  description = "Show file icons in the list view.";
                };
                tooltips = mkOption {
                  type = types.bool;
                  default = true;
                  description = "Whether or not to display tooltips.";
                };
              };
            });
            default = {};
            description = "Which user interface elements are displayed.";
          };

          useBase2Units = mkOption {
            type = types.bool;
            default = false;
            description = "Use base 2 units instead of base 10 units.";
          };
          whenOpeningAnEntry = mkOption {
            type = types.submodule ({ ... }: {
              options = {
                behavior = mkOption {
                  type = types.enum [ "nothing" "minimize" "close" ];
                  default = "nothing";
                  description = "The action to take after opening a file.";
                };

                whenOpenedUsing = mkOption {
                  type = types.submodule ({ ... }: {
                    options = {
                      keyboardShortcutsOrMenuEntries = mkOption {
                        type = types.bool;
                        default = false;
                        description = "Only apply the given behavior when the entry was opened using a keyboard shortcut or a menu entry.";
                      };

                      doubleClick = mkOption {
                        type = types.bool;
                        default = false;
                        description = "Only apply the given behavior when the entry was double clicked.";
                      };
                    };
                  });
                  default = {};
                  description = "Conditions that must be true for the behavior to apply.";
                };
              };
            });
            default = {};
            description = "The behavior that occurs when a file or folder is opened.";
          };

          exitOnEscape = mkOption {
            type = types.bool;
            default = false;
            description = "Close the program when pressing escape.";
          };

          windowSize = mkOption {
            type = types.submodule ({ ... }: {
              options = {
                width = mkOption {
                  type = types.int;
                  default = 850;
                  description = "The starting width of the main window.";
                };
                height = mkOption {
                  type = types.int;
                  default = 600;
                  description = "The starting height of the main window.";
                };
              };
            });
            default = {};
            description = "The sizing of the main window.";
          };

          columns = mkOption {
            type = types.submodule ({ ... }: {
              options = {
                order = mkOption {
                  # name_column_pos = 0, path_column_pos = 1, ...
                  type = types.listOf columnType;
                  default = [ "Name" "Path" "Type" "Size" "Modified" ];
                  description = "The order to put the columns in.";
                };

                path = mkColumn {
                  name = "path";
                  visible = true;
                  width = 250;
                };
                type = mkColumn {
                  name = "type";
                  visible = false;
                  width = 100;
                };
                extension = mkColumn {
                  name = "extension";
                  visible = false;
                  width = 100;
                };
                size = mkColumn {
                  name = "size";
                  visible = true;
                  width = 75;
                };
                modified = mkColumn {
                  name = "modified";
                  visible = true;
                  width = 125;
                };
                name = mkOption {
                  type = types.submodule ({ ... }: {
                    options = {
                      width = mkOption {
                        type = types.int;
                        default = 250;
                        description = "The width of the name column.";
                      };
                    };
                  });
                  default = {};
                  description = "Configuration for the Name column.";
                };
              };
            });
            default = {};
            description = "Which columns are displayed, what order, and at what sizes.";
          };

          sort = mkOption {
            type = types.submodule ({ ... }: {
              options = {
                mode = mkOption {
                  # sort_ascending = true | false
                  type = types.enum [ "ascending" "descending" ];
                  default = "ascending";
                  description = "Whether to sort entries in ascending or descending order.";
                };
                byColumn = mkOption {
                  # sort_by=Name (or Path or ...)
                  type = columnType;
                  default = "Name";
                  description = "The column to use the value of when sorting entries.";
                };
              };
            });
            default = {};
            description = "How search results are sorted.";
          };
        };
      });
      description = "Settings affecting the interface of the program.";
    };

    dialogs = mkOption {
      type = types.submodule ({ ... }: {
        options = {
          showDialogFailedOpening = mkOption {
            type = types.bool;
            default = true;
            description = "Show a warning dialog when a file / folder fails to open.";
          };
        };
      });
      default = {};
      description = "Settings affecting how and when the program shows dialog boxes.";
    };

    search = mkOption {
      type = types.submodule ({ ... }: {
        options = {
          searchAsYouType = mkOption {
            type = types.bool;
            default = true;
            description = "Update search results on each key press.";
          };
          autoSearchInPath = mkOption {
            type = types.bool;
            default = true;
            description = "Search in path when a query contains path separators.";
          };
          autoMatchCase = mkOption {
            type = types.bool;
            default = true;
            description = "Match case when a query contains at least one uppercase character.";
          };
          searchInPath = mkOption {
            type = types.bool;
            default = false;
            description = "Always search in path regardless of query contents.";
          };
          enableRegex = mkOption {
            type = types.bool;
            default = false;
            description = "Interpret the query as a regular expression when matching against names or paths.";
          };
          matchCase = mkOption {
            type = types.bool;
            default = false;
            description = "Require a strict case match between file names and paths and the query.";
          };
          hideResultsOnEmptySearch = mkOption {
            type = types.bool;
            default = false;
            description = "Hide results when there is no active query.";
          };
        };
      });
      default = {};
      description = "Settings controlling how searches are performed.";
    };

    database = mkOption {
      type = types.submodule ({ ... }: {
        options = {
          updateOnLaunch = mkOption {
            type = types.bool;
            default = true;
            description = "Update the database when the program is launched.";
          };
          updateAtIntervals = mkOption {
            type = types.submodule ({ ... }: {
              options = {
                enable = mkOption {
                  type = types.bool;
                  default = false;
                  description = "Update the database every via an automatically scheduled service.";
                };

                hours = mkOption {
                  type = types.int;
                  default = 0;
                  description = "The number of hours between each update.";
                };
                minutes = mkOption {
                  type = types.int;
                  default = 15;
                  description = "The number of minutes between each update.";
                };
              };
            });
            default = {};
            description = "Update the database every xx:yy hours and minutes.";
          };
          excludeHiddenFilesAndFolders = mkOption {
            type = types.bool;
            default = true;
            description = "Skip indexing hidden files and folders.";
          };
          followSymbolicLinks = mkOption {
            type = types.bool;
            default = true;
            description = "Follow symbolic links and record the destination file in the index instead of the link.";
          };

          include = mkOption {
            type = types.listOf (types.submodule ({ ... }: {
              options = {
                path = mkOption {
                  type = types.str;
                  description = "The path to the folder to include.";
                };
                enable = mkOption {
                  type = types.bool;
                  default = true;
                  description = "Enable using the index for this folder.";
                };
                update = mkOption {
                  type = types.bool;
                  default = true;
                  description = "Enable updating the index for this folder.";
                };
                oneFilesystem = mkOption {
                  type = types.bool;
                  default = false;
                  description = "???";
                };
              };
            }));
            default = [];
            description = "A list of folders to include.";
          };
          exclude = mkOption {
            type = types.submodule ({ ... }: {
              options = {
                files = mkOption {
                  type = types.listOf types.str;
                  default = [];
                  description = "A list of file patterns to exclude.";
                };
                folders = mkOption {
                  type = types.listOf (types.submodule ({ ... } : {
                    options = {
                        path = mkOption {
                        type = types.str;
                        description = "The path to the folder to exclude.";
                      };
                      enable = mkOption {
                        type = types.bool;
                        default = true;
                        description = "Whether or not to process this exclusion.";
                      };
                    };
                  }));
                  default = [
                    { path = "/proc"; }
                    { path = "/sys"; }
                  ];
                  description = "A list of folders to exclude from indexing.";
                };
              };
            });
            default = {};
            description = "Files and folders to exclude from the index.";
          };
        };
      });
      default = {};
      description = "Settings affecting how the index database is created and updated.";
    };

    filters = mkOption {
      type = types.listOf (types.submodule ({ ... }: {
        options = {
          name = mkOption {
            type = types.str;
            description = "The name of the filter.";
          };
          macro = mkOption {
            type = types.str;
            default = "";
            description = "Allows access of this filter via typing in :\${macro} into the query bar.";
          };
          query = mkOption {
            type = types.str;
            default = "";
            description = "The search query to apply.";
          };
          matchCase = mkOption {
            type = types.bool;
            default = false;
            description = "Match case between this filter's query and the search results.";
          };
          searchInPath = mkOption {
            type = types.bool;
            default = false;
            description = "Search the file/folder's path as well as its name.";
          };
          enableRegex = mkOption {
            type = types.bool;
            default = false;
            description = "Treat the search query as a regular expression.";
          };
        };
      }));
      default = [
        { name = "All"; }
        { name = "Folders"; query = "folder:"; }
        { name = "Files"; query = "file:"; }
        {
          name = "Applications";
          macro = "app";
          query = "ext:desktop;DESKTOP";
          matchCase = true;
        }
        {
          name = "Archives";
          macro = "archive";
          query = "ext:7z;ace;arj;bz2;cab;gz;gzip;jar;r00;r01;r02;r03;r04;r05;r06;r07;r08;r09;r10;r11;r12;r13;r14;r15;r16;r17;r18;r19;r20;r21;r22;r23;r24;r25;r26;r27;r28;r29;rar;tar;tgz;z;zip;7Z;ACE;ARJ;BZ2;CAB;GZ;GZIP;JAR;R00;R01;R02;R03;R04;R05;R06;R07;R08;R09;R10;R11;R12;R13;R14;R15;R16;R17;R18;R19;R20;R21;R22;R23;R24;R25;R26;R27;R28;R29;RAR;TAR;TGZ;Z;ZIP";
          matchCase = true;
        }
        {
          name = "Audio";
          macro = "audio";
          query = "ext:aac;ac3;aif;aifc;aiff;au;cda;dts;fla;flac;it;m1a;m2a;m3u;m4a;mid;midi;mka;mod;mp2;mp3;mpa;ogg;opus;ra;rmi;spc;rmi;snd;umx;voc;wav;wma;xm;AAC;AC3;AIF;AIFC;AIFF;AU;CDA;DTS;FLA;FLAC;IT;M1A;M2A;M3U;M4A;MID;MIDI;MKA;MOD;MP2;MP3;MPA;OGG;OPUS;RA;RMI;SPC;RMI;SND;UMX;VOC;WAV;WMA;XM";
          matchCase = true;
        }
        {
          name = "Documents";
          macro = "doc";
          query = "ext:c;chm;cpp;csv;cxx;doc;docm;docx;dot;dotm;dotx;h;hpp;htm;html;hxx;ini;java;lua;mht;mhtml;ods;odt;odp;pdf;potx;potm;ppam;ppsm;ppsx;pps;ppt;pptm;pptx;rtf;sldm;sldx;thmx;txt;vsd;wpd;wps;wri;xlam;xls;xlsb;xlsm;xlsx;xltm;xltx;xml;C;CHM;CPP;CSV;CXX;DOC;DOCM;DOCX;DOT;DOTM;DOTX;H;HPP;HTM;HTML;HXX;INI;JAVA;LUA;MHT;MHTML;ODS;ODT;ODP;PDF;POTX;POTM;PPAM;PPSM;PPSX;PPS;PPT;PPTM;PPTX;RTF;SLDM;SLDX;THMX;TXT;VSD;WPD;WPS;WRI;XLAM;XLS;XLSB;XLSM;XLSX;XLTM;XLTX;XML";
          matchCase = true;
        }
        {
          name = "Pictures";
          macro = "pic";
          query = "ext:ani;bmp;gif;ico;jpe;jpeg;jpg;pcx;png;psd;tga;tif;tiff;webp;wmf;ANI;BMP;GIF;ICO;JPE;JPEG;JPG;PCX;PNG;PSD;TGA;TIF;TIFF;WEBP;WMF";
          matchCase = true;
        }
        {
          name = "Videos";
          macro = "video";
          query = "ext:3g2;3gp;3gp2;3gpp;amr;amv;asf;avi;bdmv;bik;d2v;divx;drc;dsa;dsm;dss;dsv;evo;f4v;flc;fli;flic;flv;hdmov;ifo;ivf;m1v;m2p;m2t;m2ts;m2v;m4b;m4p;m4v;mkv;mp2v;mp4;mp4v;mpe;mpeg;mpg;mpls;mpv2;mpv4;mov;mts;ogm;ogv;pss;pva;qt;ram;ratdvd;rm;rmm;rmvb;roq;rpm;smil;smk;swf;tp;tpr;ts;vob;vp6;webm;wm;wmp;wmv;3G2;3GP;3GP2;3GPP;AMR;AMV;ASF;AVI;BDMV;BIK;D2V;DIVX;DRC;DSA;DSM;DSS;DSV;EVO;F4V;FLC;FLI;FLIC;FLV;HDMOV;IFO;IVF;M1V;M2P;M2T;M2TS;M2V;M4B;M4P;M4V;MKV;MP2V;MP4;MP4V;MPE;MPEG;MPG;MPLS;MPV2;MPV4;MOV;MTS;OGM;OGV;PSS;PVA;QT;RAM;RATDVD;RM;RMM;RMVB;ROQ;RPM;SMIL;SMK;SWF;TP;TPR;TS;VOB;VP6;WEBM;WM;WMP;WMV";
          matchCase = true;
        }
      ];
      description = "A set of filters that can be used to quickly trim the results list.";
    };
  };

  config = mkIf cfg.enable {
    home.packages = [ cfg.package ];

    xdg.configFile."fsearch/fsearch.conf".source =
      iniFormat.generate "fsearch.conf" (with cfg; {
        Interface = {
          single_click_open = interface.singleClickOpen;
          launch_desktop_files = interface.launchDesktopFiles;
          highlight_search_terms = interface.highlightSearchTerms;
          
          # Persist
          restore_column_configuration = interface.persist.columnConfiguration;
          restore_sort_order = interface.persist.sortOrder;
          restore_window_size = interface.persist.windowSize;

          double_click_path = interface.doubleClickPath;
          enable_dark_theme = interface.theme == "dark";

          # Show
          show_menu_bar = interface.show.menuBar;
          show_status_bar = interface.show.statusBar;
          show_filter = interface.show.filters;
          show_search_button = interface.show.searchButton;
          show_indexing_status = interface.show.indexingStatus;
          show_listview_icons = interface.show.listviewIcons;
          enable_list_tooltips = interface.show.tooltips;

          use_base_2_units = interface.useBase2Units;

          # WhenOpeningAnEntry
          action_after_file_open = 
            let v = interface.whenOpeningAnEntry.behavior; in

            if v == "nothing" then 0
            else if v == "minimize" then 1
            else if v == "close" then 2
            else 0;
          action_after_file_open_keyboard = interface.whenOpeningAnEntry.whenOpenedUsing.keyboardShortcutsOrMenuEntries;
          action_after_file_open_mouse = interface.whenOpeningAnEntry.whenOpenedUsing.doubleClick;

          exit_on_escape = interface.exitOnEscape;

          # WindowSize
          window_width = interface.windowSize.width;
          window_height = interface.windowSize.height;

          # Columns

          show_path_column = interface.columns.path.visible;
          path_column_width = interface.columns.path.width;

          show_type_column = interface.columns.type.visible;
          type_column_width = interface.columns.type.width;

          show_extension_column = interface.columns.extension.visible;
          extension_column_width = interface.columns.extension.width;

          show_size_column = interface.columns.size.visible;
          size_column_width = interface.columns.size.width;

          show_modified_column = interface.columns.modified.visible;
          modified_column_width = interface.columns.modified.width;

          name_column_width = interface.columns.name.width; 
        }
        # Column ordering
          // (builtins.foldl' ({ attrs, index }: column:
            {
              attrs = attrs // { "${strings.toLower column}_column_pos" = index; };
              index = index + 1;
            }
          ) { attrs = {}; index = 0; } interface.columns.order).attrs;

        Dialogs = {
          show_dialog_failed_opening = dialogs.showDialogFailedOpening;
        };
        Search = {
          search_as_you_type = search.searchAsYouType;
          auto_search_in_path = search.autoSearchInPath;
          auto_match_case = search.autoMatchCase;
          search_in_path = search.searchInPath;
          enable_regex = search.enableRegex;
          match_case = search.matchCase;
          hide_results_on_empty_search = search.hideResultsOnEmptySearch;
        };
        Database = {
          update_database_on_launch = database.updateOnLaunch;
          update_database_every = database.updateAtIntervals.enable;
          update_database_every_hours = database.updateAtIntervals.hours;
          update_database_every_minutes = database.updateAtIntervals.minutes;

          exclude_hidden_files_and_folders = database.excludeHiddenFilesAndFolders;
          follow_symbolic_links = database.followSymbolicLinks;

          exclude_files = builtins.concatStringsSep ";" database.exclude.files;
        }
          // (builtins.foldl' ({ attrs, index }: entry:
            {
              index = index + 1;
              attrs = attrs // {
                "location_${builtins.toString index}" = entry.path;
                "location_enabled_${builtins.toString index}" = entry.enable;
                "location_update_${builtins.toString index}" = entry.update;
                "location_one_filesystem_${builtins.toString index}" = entry.oneFilesystem;
              };
            }
          ) { attrs = {}; index = 1; } database.include).attrs

          // (builtins.foldl' ({ attrs, index }: entry:
            {
              index = index + 1;
              attrs = attrs // {
                "exclude_location_${builtins.toString index}" = entry.path;
                "exclude_location_enabled_${builtins.toString index}" = entry.enable;
              };
            }
          ) { attrs = {}; index = 1; } database.exclude.folders).attrs;

        Filters = (builtins.foldl' ({ attrs, index }: entry:
          {
            index = index + 1;
            attrs = attrs // {
              "filter_${builtins.toString index}_name" = entry.name;
              "filter_${builtins.toString index}_macro" = entry.macro;
              "filter_${builtins.toString index}_query" = entry.query;
              "filter_${builtins.toString index}_match_case" = entry.matchCase;
              "filter_${builtins.toString index}_search_in_path" = entry.searchInPath;
              "filter_${builtins.toString index}_enable_regex" = entry.enableRegex;
            };
          }
        ) { attrs = {}; index = 1; } filters).attrs;
      });
  };
}