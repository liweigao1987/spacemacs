;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(rust
     html
     octave
     csv
     ruby
     web-beautify
     (javascript :variables
                 javascript-backend 'tern
                 javascript-fmt-tool 'web-beautify
                 javascript-import-tool 'import-js)
     (typescript :variables
                 typescript-backend 'tide)
     yaml
     ;; ivy
     helm
     ;; compleseus
     (json : variables json-backend 'lsp)
     lwg
     ;; semantic
     (python :variables
             python-backend 'lsp
             python-lsp-server 'pyright)
     (java :variables
           java-backend 'meghanada)
     (c-c++ :variables
            c-c++-enable-clang-support t
            ;;c-c++-lsp-enable-semantic-highlight 'rainbow
            c-c++-backend 'lsp-clangd)
     (groovy :variables
             groovy-backend 'company-groovy)
     ;;gtags
     common-lisp
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     (auto-completion :variables
                      auto-completion-enable-snippets-in-popup t)
     better-defaults
     emacs-lisp
     (cmake :variables
            cmake-backend 'lsp)
     (git :variables
          git-enable-magit-gitflow-plugin t
          git-enable-magit-delta-plugin t)
     (lsp :variables
          lsp-lens-enable nil)
     markdown
     multiple-cursors
     ;; org
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     spell-checking
     syntax-checking
     ;; version-control
     treemacs
     asm
     ;; cscope
     )


   ;; List of additional packages that will be installed without being wrapped
   ;; in a layer (generally the packages are installed only and should still be
   ;; loaded using load/require/use-package in the user-config section below in
   ;; this file). If you need some configuration for these packages, then
   ;; consider creating a layer. You can also put the configuration in
   ;; `dotspacemacs/user-config'. To use a local version of a package, use the
   ;; `:location' property: '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(easy-kill browse-kill-ring android-mode android-env counsel all-the-icons-ibuffer all-the-icons-ivy-rich ivy-rich
                                                ;; evil-ediff was removed from elpa, but is still referenced in spacemacs-edit layer...
                                                (evil-ediff :location (recipe :fetcher github :repo "emacs-evil/evil-ediff")))

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(evil-collection eat)

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need to
   ;; compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;;
   ;; WARNING: pdumper does not work with Native Compilation, so it's disabled
   ;; regardless of the following setting when native compilation is in effect.
   ;;
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=$HOME/.emacs.d/.cache/dumps/spacemacs-27.1.pdmp
   ;; (default (format "spacemacs-%s.pdmp" emacs-version))
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'emacs

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `recents-by-project' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   ;; The exceptional case is `recents-by-project', where list-type must be a
   ;; pair of numbers, e.g. `(recents-by-project . (7 .  5))', where the first
   ;; number is the project limit and the second the limit on the recent files
   ;; within a project.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Show numbers before the startup list lines. (default t)
   dotspacemacs-show-startup-list-numbers t

   ;; The minimum delay in seconds between number key presses. (default 0.4)
   dotspacemacs-startup-buffer-multi-digit-delay 0.4

   ;; If non-nil, show file icons for entries and headings on Spacemacs home buffer.
   ;; This has no effect in terminal or if "all-the-icons" package or the font
   ;; is not installed. (default nil)
   dotspacemacs-startup-buffer-show-icons nil

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
   ;; *scratch* buffer will be saved and restored automatically.
   dotspacemacs-scratch-buffer-persistent nil

   ;; If non-nil, `kill-buffer' on *scratch* buffer
   ;; will bury it instead of killing.
   dotspacemacs-scratch-buffer-unkillable nil

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator arrow :separator-scale 1.5)
   ;; dotspacemacs-mode-line-theme '(doom)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts. The `:size' can be specified as
   ;; a non-negative integer (pixel size), or a floating-point (point size).
   ;; Point size is recommended, because it's device independent. (default 10.0)
   dotspacemacs-default-font '("Source Code Pro"
                               :size 10.0
                               :weight normal
                               :width normal)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m" for terminal mode, "<M-return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' in OSX to obtain
   ;; borderless fullscreen. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Show the scroll bar while scrolling. The auto hide time can be configured
   ;; by setting this variable to a number. (default t)
   dotspacemacs-scroll-bar-while-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but only visual lines are counted. For example, folded lines will not be
   ;; counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers t

   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil and `dotspacemacs-activate-smartparens-mode' is also non-nil,
   ;; `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil smartparens-mode will be enabled in programming modes.
   ;; (default t)
   dotspacemacs-activate-smartparens-mode t

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis t

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; The backend used for undo/redo functionality. Possible values are
   ;; `undo-tree', `undo-fu' and `undo-redo', see also `evil-undo-system'.
   ;; Note that saved undo history does not get transferred when changing
   ;; from undo-tree to undo-fu or undo-redo.
   ;; The default is currently 'undo-tree, but it will likely be changed
   ;; and at some point removed because undo-tree is not maintained anymore.
   dotspacemacs-undo-system 'undo-redo

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; If nil then Spacemacs uses default `frame-title-format' to avoid
   ;; performance issues, instead of calculating the frame title by
   ;; `spacemacs/title-prepare' all the time.
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Show trailing whitespace (default t)
   dotspacemacs-show-trailing-whitespace t

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; If non-nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfere with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; Accept SPC as y for prompts if non-nil. (default nil)
   dotspacemacs-use-SPC-as-y nil

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non-nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil

   ;; If non-nil then byte-compile some of Spacemacs files.
   dotspacemacs-byte-compile nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env)
  )

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  (setq configuration-layer-elpa-archives
        '(("melpa-cn" . "http://mirrors.cloud.tencent.com/elpa/melpa/")
          ("org-cn"   . "http://mirrors.cloud.tencent.com/elpa/org/")
          ("gnu-cn"   . "http://mirrors.cloud.tencent.com/elpa/gnu/")))  
)

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )


(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
  (load-file "/home/liweigao/.emacs.d/private/local/lwg-mode.el")
  (setq c-basic-offset 4)
  (setq projectile-enable-caching t)
  (setq vc-follow-symlinks t)
  (setq lsp-enable-file-watchers nil)
  ;; (setq lsp-headerline-breadcrumb-segments '(path-up-to-project file))
  (setq lsp-headerline-breadcrumb-enable-diagnostics nil)
  ;; (setq lsp-headerline-breadcrumb-icons-enable nil)
  ;; (setq lsp-headerline-arrow "/")
  (setq lsp-java-server-install-dir "/home/liweigao/work/project/spacemacs/download/jdt-language-server/jdt-language-server-0.68.0-202101202016/")
  (define-coding-system-alias 'UTF-8 'utf-8)
  (blink-cursor-mode)
  (browse-kill-ring-default-keybindings)
  (require 'android-mode)
  (setq android-mode-sdk-dir "/home/liweigao/Android/Sdk/")
  ;; (global-set-key (kbd "<backtab>") 'evil-shift-left)
  ;; (global-set-key (kbd "M-n") 'evil-jump-forward)
  ;; (global-set-key (kbd "M-p") 'evil-jump-backward)
  ;; (global-set-key (kbd "M-q") 'mark-sexp)
  (global-set-key [remap kill-ring-save] 'easy-kill)
  (global-set-key [remap mark-sexp] 'easy-mark)
  (global-set-key (kbd "C-'") 'easy-mark)
  ;; (global-set-key (kbd "C-\"") 'sp-kill-sexp)
  (global-set-key (kbd "M-k") 'sp-kill-sexp)
  (global-set-key (kbd "<f5>") 'lwg-goto-match-paren)
  (spacemacs/set-leader-keys "d f" 'find-name-dired)
  (spacemacs/set-leader-keys "j m" 'evil-jump-item)
  (spacemacs/set-leader-keys "s e" 'iedit-mode)
  (spacemacs/set-leader-keys "m g w" 'lsp-find-declaration)
  (setq org-agenda-files '("/home/liweigao/work/project/spacemacs/org/agenda/"))
  (setq org-default-notes-file "/home/liweigao/work/project/spacemacs/org/agenda/default.org")
  (setq org-crypt-tag-matcher "account")
  (setq org-tags-exclude-from-inheritance (quote ("account")))
  (setq org-crypt-key nil)
  (org-crypt-use-before-save-magic)
  (setq native-comp-async-report-warnings-errors nil)
  (set-frame-parameter (car (frame-list)) 'undecorated t)
  (add-to-list 'spacemacs-indent-sensitive-modes 'c-mode)
  (add-to-list 'spacemacs-indent-sensitive-modes 'c++-mode)
  (indent-guide-global-mode)
  (setq helm-move-to-line-cycle-in-source nil)
  (with-eval-after-load 'treemacs
    (define-key treemacs-mode-map (kbd ":") 'treemacs-bulk-file-actions)
    (define-key treemacs-mode-map (kbd "M") 'lwg-treemacs-mark-unmark-path-easy)
    (define-key treemacs-mode-map (kbd "D") 'treemacs-delete-marked-paths))
  (with-eval-after-load 'lsp-mode
    (setq lsp-client-packages (delete 'lsp-semgrep lsp-client-packages)))
  (setq-default bidi-display-reordering nil)
  (setq bidi-inhibit-bpa t
        long-line-threshold 1000
        large-hscroll-threshold 1000
        syntax-wholeline-max 1000)
  (spacemacs/toggle-vi-tilde-fringe-off)
  ;; (setq lsp-enable-on-type-formatting nil)
  ;;(setq iedit-toggle-key-default t)
  ;; (use-package all-the-icons-ibuffer
  ;;   :ensure t
  ;;   :init (all-the-icons-ibuffer-mode 1))
  ;; (use-package all-the-icons-ivy-rich
  ;;   :ensure t
  ;;   :init (all-the-icons-ivy-rich-mode 1))
  ;; (use-package ivy-rich
  ;;   :ensure t
  ;;   :init (ivy-rich-mode 1))
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol nil)
 '(flycheck-checker-error-threshold nil)
 '(lsp-enable-links nil)
 '(org-capture-templates
   '(("t" "Task" entry
      (file+datetree "/home/liweigao/work/project/spacemacs/org/agenda/task.org")
      "* TODO [P:%^{priority|5|0|1|2|3|4|5|6|7|8|9}] %^{title} %^g\12%?\12deadline: %^t"
      :empty-lines 1)
     ("w" "Weekly report" entry
      (file+weektree
       "/home/liweigao/work/project/spacemacs/org/agenda/weekly.org")
      "* TODO  %<%Y>年%<%W>周  %t :weekly:\12- 鸿鹄二代语音方案：\12\11%?\12- 智慧公交大屏TTS：\12\12- android车联网TTS：\12\12- 手百TTS：\12\12- 百度地图TTS：\12\12- LINUX TTS：\12\12- 私有化TTS：\12\12- 跨平台TTS：\12\12- 度秘冬时闹钟：\12\12"
      :empty-lines 2)
     ("a" "Account" entry
      (file "/home/liweigao/work/project/spacemacs/org/agenda/account.org")
      "* %U - %^{title} :account:\12 - account: %^{account}\12 - password: %^{password}"
      :empty-lines 1 :kill-buffer t)
     ("m" "Memory")
     ("mw" "Work" entry
      (file+datetree "/home/liweigao/work/project/spacemacs/org/agenda/work.org")
      "* %^{title} :work:%^g\12%?" :empty-lines 1)
     ("mt" "Tool" entry
      (file "/home/liweigao/work/project/spacemacs/org/agenda/tool.org")
      "* %^{title} :tool:%^g\12%?" :empty-lines 1)
     ("ml" "Life" entry
      (file+datetree "/home/liweigao/work/project/spacemacs/org/agenda/life.org")
      "* %^{title} :life:%^g\12%?" :empty-lines 1)))
 '(package-selected-packages
   '(ac-ispell ace-jump-helm-line ace-link add-node-modules-path aggressive-indent
               all-the-icons-ibuffer all-the-icons-ivy-rich anaconda-mode
               auto-compile auto-dictionary auto-highlight-symbol auto-yasnippet
               blacken bmx-mode browse-kill-ring bui bundler
               centered-cursor-mode chruby clean-aindent-mode
               column-enforce-mode company-anaconda company-c-headers
               company-rtags company-web company-ycmd concurrent counsel
               counsel-css counsel-gtags cpp-auto-include csv-mode ctable
               cython-mode dap-mode dash-functional define-word devdocs diminish
               disaster doom-modeline dotenv-mode dumb-jump editorconfig
               elisp-slime-nav emmet-mode emr enh-ruby-mode epc esh-help
               eshell-prompt-extras eshell-z eval-sexp-fu evil-anzu evil-args
               evil-cleverparens evil-escape evil-exchange evil-goggles
               evil-iedit-state evil-indent-plus evil-lion evil-lisp-state
               evil-matchit evil-mc evil-nerd-commenter evil-numbers
               evil-surround evil-textobj-line evil-tutor evil-unimpaired
               evil-visual-mark-mode evil-visualstar expand-region eyebrowse
               fancy-battery flx-ido flycheck-elsa flycheck-package
               flycheck-pos-tip flycheck-rtags flycheck-ycmd
               flyspell-correct-helm font-lock+ fuzzy ggtags gh-md golden-ratio
               google-c-style google-translate grizzl haml-mode helm-ag
               helm-c-yasnippet helm-company helm-cscope helm-css-scss
               helm-descbinds helm-flx helm-gtags helm-ls-git helm-make
               helm-mode-manager helm-org helm-projectile helm-purpose
               helm-pydoc helm-rtags helm-swoop helm-themes helm-xref
               highlight-indentation highlight-numbers highlight-parentheses
               hl-todo htmlize hungry-delete hybrid-mode impatient-mode
               import-js importmagic indent-guide inf-ruby ivy js-doc js2-mode
               js2-refactor link-hint live-py-mode livid-mode lorem-ipsum
               lsp-javacomp lsp-julia lsp-mode lsp-pyright lsp-python-ms
               lsp-treemacs lsp-ui lsp-ui-util macrostep markdown-toc minitest
               mmm-mode move-text multi-term multiple-cursors mwim nameless
               nodejs-repl npm-mode open-junk-file org-superstar overseer
               paradox password-generator pcre2el pip-requirements pipenv pippel
               popwin posframe powershell prettier-js pug-mode py-isort
               pyenv-mode pytest pythonic pyvenv rainbow-delimiters rake rbenv
               restart-emacs robe ron-mode rspec-mode rubocop rubocopfmt
               ruby-hash-syntax ruby-refactor ruby-test-mode ruby-tools
               rust-mode rvm sass-mode scss-mode seeing-is-believing shell-pop
               shrink-path simple-httpd skewer-mode slim-mode
               spaceline-all-the-icons sphinx-doc stickyfunc-enhance
               string-inflection swiper symbol-overlay symon tagedit
               terminal-here tern toc-org treemacs-evil treemacs-icons-dired
               treemacs-persp treemacs-projectile undo-tree unfill use-package
               uuidgen vi-tilde-fringe volatile-highlights vterm web-beautify
               web-completion-data web-mode which-key which-key-posframe winum
               writeroom-mode ws-butler xcscope xterm-color yaml-mode yapfify
               yasnippet-snippets))
 '(treemacs-use-follow-mode nil t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight-parentheses-highlight ((nil (:weight ultra-bold))) t)
 '(line-number-current-line ((t (:inherit line-number :background "#212026" :foreground "lawn green")))))
)
