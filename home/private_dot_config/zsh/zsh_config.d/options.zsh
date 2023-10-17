# --------------------
# Changing Directories
# --------------------

# auto `cd` to a directory without typing `cd`
setopt AUTO_CD

# make `cd` push the old directory onto the directory stack
setopt AUTO_PUSHD

# `cd` to a path stored in a variable
setopt CDABLE_VARS

# do not store duplicates in the directory stack
setopt PUSHD_IGNORE_DUPS

# do not print the directory stack after `pushd` or `popd`
setopt PUSHD_SILENT

# push to `$HOME` directory when no argument is given
setopt PUSHD_TO_HOME

# ----------
# Completion
# ----------

# move cursor to the end of a completed word
setopt ALWAYS_TO_END

# automatically list choices on an ambiguous completion
setopt AUTO_LIST

# show completion menu on a successive tab press
setopt AUTO_MENU

# if completed parameter is a directory, add a trailing slash
setopt AUTO_PARAM_SLASH

# complete from both ends of a word
setopt COMPLETE_IN_WORD

# do not autoselect the first completion entry
unsetopt MENU_COMPLETE

# ----------------------
# Expansion and Globbing
# ----------------------

# use extended globbing syntax
setopt EXTENDED_GLOB

# -------
# History
# -------

# treat the '!' character specially during expansion
setopt BANG_HIST

# write the history file in the ':start:elapsed;command' format
setopt EXTENDED_HISTORY

# beep when accessing non-existent history
setopt HIST_BEEP

# expire a duplicate event first when trimming history
setopt HIST_EXPIRE_DUPS_FIRST

# do not display a previously found event
setopt HIST_FIND_NO_DUPS

# delete an old recorded event if a new event is a duplicate
setopt HIST_IGNORE_ALL_DUPS

# do not record an event that was just recorded again
setopt HIST_IGNORE_DUPS

# do not record an event starting with a space
setopt HIST_IGNORE_SPACE

# remove superflouous blanks from each command line
setopt HIST_REDUCE_BLANKS

# do not write a duplicate event to the history file
setopt HIST_SAVE_NO_DUPS

# do not execute immediately upon history expansion
setopt HIST_VERIFY

# share history between all sessions
setopt SHARE_HISTORY

# ------------
# Input/Output
# ------------

# do not overwrite existing files with > and >>
# use >! and >>! to bypass
unsetopt CLOBBER

# disable start/stop characters (usually ^S/^Q) in the shell's editor
unsetopt FLOW_CONTROL

# allow comments in interactive shell
setopt INTERACTIVE_COMMENTS

# don't print a warning message if a mail file has been accessed
unsetopt MAIL_WARNING

# perform path search even on command names with slashes
setopt PATH_DIRS

# allow 'Henry''s Garage' instead of 'Henry'\''s Garage'
setopt RC_QUOTES

# -----------
# Job Control
# -----------

# attempt to resume existing job before creating a new process
setopt AUTO_RESUME

# don't run all background jobs at a lower priority
unsetopt BG_NICE

# don't report on jobs when shell exit
unsetopt CHECK_JOBS

# don't kill jobs on shell exit
unsetopt HUP

# list jobs in the long format by default
setopt LONG_LIST_JOBS

# report status of background jobs immediately
setopt NOTIFY

# ---------------------
# Scripts and Functions
# ---------------------

# write to multiple descriptors
setopt MULTIOS

# ---
# ZLE
# ---

# beep on error in line editor
setopt BEEP

# combine zero-width punctuation characters (accents) with the base character
setopt COMBINING_CHARS
