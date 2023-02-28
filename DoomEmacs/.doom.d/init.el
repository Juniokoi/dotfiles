;;; init.el -*- lexical-binding: t; -*-

;; This file controls what Doom modules are enabled and what order they load
;; in. Remember to run 'doom sync' after modifying it!

;; NOTE Press 'SPC h d h' (or 'C-h d h' for non-vim users) to access Doom's
;;      documentation. There you'll find a link to Doom's Module Index where all
;;      of our modules are listed, including what flags they support.

;; NOTE Move your cursor over a module's name (or its flags) and press 'K' (or
;;      'C-c c k' for non-vim users) to view its documentation. This works on
;;      flags as well (those symbols that start with a plus).
;;
;;      Alternatively, press 'gd' (or 'C-c c d') on a module to browse its
;;      directory (for easy access to its source code).


(doom! :input
       ;;bidi              ; (tfel ot) thgir etirw uoy gnipleh
       ;;chinese
       ;;japanese
       ;;layout            ; auie,ctsrnm is the superior home row

       :completion
       company         ; the ultimate code completion backend
       (ivy +fuzzy +prescient +icons); a search engine for love and life
       (vertico +icons); the search engine of the future

       :ui
       deft              ; notational velocity for Emacs
       doom              ; what makes DOOM look the way it does
       doom-dashboard    ; a nifty splash screen for Emacs
       doom-quit         ; DOOM quit-message prompts when you quit Emacs
       (emoji +github +unicode)  ; 🙂
       hl-todo           ; highlight TODO/FIXME/NOTE/DEPRECATED/HACK/REVIEW
       hydra
       indent-guides     ; highlighted indent columns
       (ligatures
                +fira
                +extra)         ; ligatures and symbols to make your code pretty again
       minimap           ; show a map of the code on the side
       modeline          ; snazzy, Atom-inspired modeline, plus API
       nav-flash         ; blink cursor line after big motions
       ophints           ; highlight the region an operation acts on
       (popup +defaults)   ; tame sudden yet inevitable temporary windows
       tabs              ; a tab bar for Emacs
       treemacs          ; a project drawer, like neotree but cooler
       unicode           ; extended unicode support for various languages
       (vc-gutter +pretty) ; vcs diff in the fringe
       vi-tilde-fringe   ; fringe tildes to mark beyond EOB
       (window-select
                +numbers
                +switch-window)     ; visually switch windows
       workspaces        ; tab emulation, persistence & separate workspaces
       zen               ; distraction-free coding or writing

       :editor
       (evil +everywhere); come to the dark side, we have cookies
       file-templates    ; auto-snippets for empty files
       fold              ; (nigh) universal code folding
       (format +onsave)  ; automated prettiness
       multiple-cursors  ; editing in many places at once
       parinfer          ; turn lisp into python, sort of
       rotate-text       ; cycle region at point between text candidates
       snippets          ; my elves. They type so I don't have to
       word-wrap         ; soft wrapping with language-aware indent

       :emacs
       (dired +ranger +icons); making dired pretty [functional]
       electric          ; smarter, keyword-based electric-indent
       (ibuffer +icons); interactive buffer management
       (undo +tree); persistent, smarter undo for your inevitable mistakes
       vc                ; version-control and Emacs, sitting in a tree

       :term
       vterm             ; the best terminal emulation in Emacs

       :checkers
       syntax              ; tasing you for every semicolon you forget
       grammar           ; tasing grammar mistake every you make

       :tools
       (debugger +lsp)     ; FIXME stepping through code, to help you add bugs
       direnv
       (docker +lsp)
       editorconfig      ; let someone else argue about tabs vs spaces
       (eval +overlay)     ; run code, run (also, repls)
       gist              ; interacting with github gists
       lookup              ; navigate your code and its documentation
       (lsp +peek +eglot)               ; M-x vscode
       (magit +forge)             ; a git porcelain for Emacs
       pass              ; password manager for nerds
       rgb               ; creating color strings
       tree-sitter       ; syntax and parsing, sitting in a tree...
       upload            ; map local to remote projects via ssh/ftp

       :os
       (:if IS-MAC macos)  ; improve compatibility with macOS
       tty               ; improve the terminal Emacs experience

       :lang
       (cc +lsp)         ; C > C++ == 1
       data              ; config/data formats
       (emacs-lisp +lsp); drown in parentheses
       (go +lsp)         ; the hipster dialect
       (graphql +lsp)    ; Give queries a REST
       json              ; At least it ain't XML
       (java +lsp)       ; the poster child for carpal tunnel syndrome
       javascript        ; all(hope(abandon(ye(who(enter(here))))))
       lua               ; one-based indices? one-based indices
       (markdown +grip); writing docs for people to ignore
       (org
        +attatch
        +journal
        +export
        +babel
        +present
        +pretty
        +pomodoro
        +present
        +hugo
        +brain
        +noter)
       rest              ; Emacs as a REST client
       (ruby +rails +lsp +rvm +rbenv)     ; 1.step {|i| p "Ruby is #{i.even? ? 'love' : 'life'}"}
       (rust +lsp)       ; Fe2O3.unwrap().unwrap().unwrap().unwrap()
       (sh +fish +lsp); she sells {ba,z,fi}sh shells on the C xor
       web               ; the tubes
       (yaml +lsp); JSON, but readable

       :email
       (mu4e +org +gmail)
       ;;notmuch
       ;;(wanderlust +gmail)

       :app
       calendar
       emms
       everywhere        ; *leave* Emacs!? You must be joking
       irc               ; how neckbeards socialize
       (rss +org)        ; emacs as an RSS reader
       twitter           ; twitter client https://twitter.com/vnought

       :config
       (default +bindings +smartparens)
       literate)
