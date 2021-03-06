(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
  ;; and `package-pinned-packages`. Most users will not need or want to do this.
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  )

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-view-evince-keep-focus nil)
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(column-number-mode t)
 '(custom-enabled-themes '(misterioso))
 '(display-fill-column-indicator-column 90)
 '(global-visual-line-mode t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(org-agenda-custom-commands
   '(("n" "Agenda and all TODO's"
      ((agenda ""
               ((org-agenda-span 10)))
       (alltodo "" nil))
      nil)))
 '(org-agenda-files
   '("/home/cmhyett/Dropbox/Research/TetradTurbulence/MLCoarseGrainedVGT/docs/Article/article.org" "~/Dropbox/GTD/brownBag.org" "~/Dropbox/GTD/inbox.org" "~/Dropbox/GTD/Projects/projects.org" "~/Dropbox/GTD/today.org" "~/Dropbox/GTD/tickler.org"))
 '(org-agenda-hide-tags-regexp "tj")
 '(org-agenda-tags-column -100)
 '(org-agenda-todo-ignore-scheduled 'future)
 '(org-agenda-todo-list-sublevels nil)
 '(org-babel-load-languages '((emacs-lisp . t) (shell . t) (python . t)))
 '(org-clock-clocktable-default-properties '(:maxlevel 5))
 '(org-default-priority 68)
 '(org-export-backends '(ascii html icalendar latex odt org taskjuggler))
 '(org-format-latex-header
   "\\documentclass{article}
\\usepackage[usenames]{color}
[PACKAGES]
[DEFAULT-PACKAGES]
\\pagestyle{empty}             % do not remove
% The settings below are copied from fullpage.sty
\\setlength{\\textwidth}{\\paperwidth}
\\addtolength{\\textwidth}{-3cm}
\\setlength{\\oddsidemargin}{1.5cm}
\\addtolength{\\oddsidemargin}{-2.54cm}
\\setlength{\\evensidemargin}{\\oddsidemargin}
\\setlength{\\textheight}{\\paperheight}
\\addtolength{\\textheight}{-\\headheight}
\\addtolength{\\textheight}{-\\headsep}
\\addtolength{\\textheight}{-\\footskip}
\\addtolength{\\textheight}{-3cm}
\\setlength{\\topmargin}{1.5cm}
\\addtolength{\\topmargin}{-2.54cm}

\\usepackage{amsmath,amsthm,amssymb, graphicx, multicol, array}

\\newcommand{\\N}{\\mathbb{N}}
\\newcommand{\\Z}{\\mathbb{Z}}
\\newcommand{\\Q}{\\mathbb{Q}}
\\newcommand{\\R}{\\mathbb{R}}
\\newcommand{\\C}{\\mathbb{C}}
\\newcommand{\\Lagr}{\\mathcal{L}}
\\newcommand{\\act}{\\mathcal{S}}

\\newcommand{\\norm}[1]{\\left\\lVert#1\\right\\rVert}
\\newcommand{\\ceil}[1]{\\lceil#1\\rceil}
\\newcommand{\\ov}{\\overline}
\\newcommand{\\cleq}{\\preccurlyeq}
\\newcommand{\\cgeq}{\\succcurlyeq}
\\newcommand{\\bdy}{\\textbf{\\text{Bdy}}}
\\newcommand{\\trace}{\\text{trace}}
\\newcommand{\\dom}{\\textbf{dom}}
\\newcommand{\\expec}{\\mathbb{E}}
\\newcommand{\\bigO}{\\mathcal{O}}
\\newcommand{\\A}{\\mathcal{A}}")
 '(org-format-latex-options
   '(:foreground default :background default :scale 2 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
                 ("begin" "$1" "$" "$$" "\\(" "\\[")))
 '(org-hierarchical-todo-statistics nil)
 '(org-highest-priority 65)
 '(org-image-actual-width '(3))
 '(org-latex-packages-alist nil)
 '(org-latex-toc-command "\\tableofcontents \\clearpage

")
 '(org-list-allow-alphabetical t)
 '(org-lowest-priority 70)
 '(org-preview-latex-process-alist
   '((dvipng :programs
             ("latex" "dvipng")
             :description "dvi > png" :message "you need to install the programs: latex and dvipng." :image-input-type "dvi" :image-output-type "png" :image-size-adjust
             (1.0 . 1.0)
             :latex-compiler
             ("latex -interaction nonstopmode -output-directory %o %f")
             :image-converter
             ("dvipng -D %D -T tight -o %O %f"))
     (dvisvgm :programs
              ("latex" "dvisvgm")
              :description "dvi > svg" :message "you need to install the programs: latex and dvisvgm." :image-input-type "dvi" :image-output-type "svg" :image-size-adjust
              (1.7 . 1.5)
              :latex-compiler
              ("latex -interaction nonstopmode -output-directory %o %f")
              :image-converter
              ("dvisvgm %f -n -b min -c %S -o %O"))
     (convert :programs
              ("xelatex" "convert")
              :description "pdf > png" :message "you need to install the programs: latex and imagemagick." :image-input-type "pdf" :image-output-type "png" :image-size-adjust
              (1.0 . 1.0)
              :latex-compiler
              ("xelatex -interaction nonstopmode -output-directory %o %f")
              :image-converter
              ("convert -density %D -trim -antialias %f -quality 100 %O"))))
 '(org-priority-default 68)
 '(org-priority-highest 65)
 '(org-priority-lowest 70)
 '(org-support-shift-select t)
 '(org-taskjuggler-default-reports
   '("textreport report \"Plan\" {
  formats html
  header '== %title =='

  center -8<-
    [#Plan Plan] | [#Resource_Allocation Resource Allocation]
    ----
    === Plan ===
    <[report id=\"plan\"]>
    ----
    === Resource Allocation ===
    <[report id=\"resourceGraph\"]>
  ->8-
}

# A traditional Gantt chart with a project overview.
taskreport plan \"\" {
  headline \"Project Plan\"
  columns bsi, name, start, end, effort, complete, chart
  loadunit shortauto
  hideresource 1
}

# A graph showing resource allocation. It identifies whether each
# resource is under- or over-allocated for.
resourcereport resourceGraph \"\" {
  headline \"Resource Allocation Graph\"
  columns no, name, effort, weekly
  loadunit shortauto
  hidetask ~(isleaf() & isleaf_())
  sorttasks plan.start.up
}"))
 '(package-selected-packages
   '(python-mode ess fill-column-indicator org-ref org-gtd auctex))
 '(read-buffer-completion-ignore-case t)
 '(read-file-name-completion-ignore-case t)
 '(show-paren-mode t)
 '(word-wrap nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(term-color-blue ((t (:background "cyan" :foreground "cyan")))))

(setq-default truncate-lines t)
(setq-default global-visual-line-mode t)

;; auctex stuff
(setq Tex-auto-save t)
(setq Tex-parse-self t)
(setq-default Tex-master nil)
(setq org-latex-create-formula-image-program 'dvipng)
(set-default 'preview-scale-function 10.0)

;; enable org mode
(require 'org)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cc" 'org-capture)
(setq org-log-done t)
(require 'org-attach-git)
(require 'org-inlinetask)

;; customize org numbering
(setq org-list-demote-modify-bullet
      '(("+" . "-") ("-" . "+") ("1." . "a.") ("a." . "-")))

;; default org file apps
(setq -org-file-apps
      '(("\\.x?html?\\'" . "google-chrome %s")
	("\\.pdf\\(::[0-9]+\\)?\\'" . "google-chrome %s")
	(auto-mode . emacs)))

;; org agenda files
;; (setq org-agenda-files (list "/home/cmhyett/Dropbox/Research/TetradTurbulence/MLCoarseGrainedVGT/docs/Article/article.org"
;; 			     "~/Dropbox/GTD/brownBag.org"
;; 			     "~/Dropbox/GTD/inbox.org"
;;  			     "~/Dropbox/GTD/Projects/projects.org"
;;  			     "~/Dropbox/GTD/today.org"
;;  			     "~/Dropbox/GTD/tickler.org"
;; 			     "~/Dropbox/ClassNotes/Math541_MathPhysics/mathPhysics.org"
;; 			     "~/Dropbox/ClassNotes/Math565B_StochasticProcesses/stochasticProcesses.org"))

(setq org-agenda-files (list "~/Dropbox/GTD/brownBag.org"
			     "~/Dropbox/GTD/inbox.org"
 			     "~/Dropbox/GTD/today.org"
 			     "~/Dropbox/GTD/tickler.org"))

;; org capture mode
(setq org-capture-templates '(("t" "Todo [inbox]" entry
			       (file "~/Dropbox/GTD/inbox.org")
			       "* TODO %i%?")
			      ("T" "Tickler" entry
			       (file "~/Dropbox/GTD/tickler.org")
			       "* %i%? \n %U")))

;; org refile targets
(setq org-refile-targets '(("~/Dropbox/GTD/Projects/projects.org" :maxlevel . 3)
			   ("~/Dropbox/GTD/someday.org" :level . 1)
			   ("~/Dropbox/GTD/today.org" :level . 1)
			   ("~/Dropbox/GTD/tickler.org" :maxlevel . 2)
			   ("~/Dropbox/GTD/archive.org" :level . 1)))

;; org custom agenda commands
(defun org-current-is-todo ()
  (string="TODO" (org-get-todo-state)))

;; org image preview sizes
(setq org-image-actual-width nil)

;; ace-window setup
;; (global-set-key (kbd "C-x o") 'ace-window)

(add-to-list 'load-path "~/.emacs.d/elpa/julia-emacs")
(require 'julia-mode)

;; add task-juggler
(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'ox-taskjuggler)
(add-to-list 'org-export-backends 'taskjuggler)
(setq org-taskjuggler-project-tag "tj")

;; org-ref variables
(setq reftex-default-bibliography '("~/Dropbox/bibliography/references.bib"))
  ;; see org-ref for use of these variables
(setq org-ref-bibliography-notes "~/Dropbox/bibliography/notes.org"
      org-ref-default-bibliography '("~/Dropbox/bibliography/references.bib")
      org-ref-pdf-directory "~/Dropbox/bibliography/bibtex-pdfs/")
(setq org-latex-pdf-process (list "latexmk -shell-escape -bibtex -f -pdflatex=xelatex -pdf %f"))
(require 'org-ref)
(require 'doi-utils)

(add-to-list 'org-latex-classes
	     '("revtex4-1"
	       "\\documentclass{revtex4-1}"
	       ("\\section{%s}" . "\\section*{%s}")
	       ("\\subsection{%s}" . "\\subsection*{%s}")       
	       ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
	     )

(add-hook 'julia-mode-hook 'display-fill-column-indicator-mode)

(fset 'org-latex-insert-equation
   (kmacro-lambda-form [?\\ ?b ?e ?g ?i ?n ?\{ ?e ?q ?u ?a ?t ?i ?o ?n ?\} return return ?\\ ?e ?n ?d ?\{ ?e ?q ?u ?a ?t ?i ?o ?n ?\} ?\C-c ?\' ?\C-p tab] 0 "%d"))


(setq python-shell-interpreter "python3")
