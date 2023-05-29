#-- add
abbr -a ga      'git add'
abbr -a gap     'git add -p'
abbr -a gaa     'git add --all'
abbr -a gac     'git add --all && git commit -v'
abbr -a gacm    'git add --all && git commit -vm'
abbr -a gac!    'git add --all && git commit --amend'
abbr -a gacf    'git add --all && git commit -v --fixup'
abbr -a gacfh   'git add --all && git commit -v --fixup HEAD'
abbr -a garh!   'git add --all && git reset --hard HEAD'

abbr -a gc      'git commit -v'
abbr -a gc!     'git commit --amend'
abbr -a gcm     'git commit -vm'
abbr -a gcf     'git commit -v --fixup'
abbr -a gcfh    'git commit -v --fixup HEAD'

abbr -a gst     'git stash'
abbr -a gstp    'git stash pop'
abbr -a gstc    'git stash clear'

#-- branches
abbr -a gb      'git branch'
abbr -a gba     'git branch --all'
abbr -a gbd     'git branch -D'

abbr -a gco     'git checkout'
abbr -a gcom    'git checkout main || gco master'
abbr -a gcob    'git checkout -b'
abbr -a gcop    'git checkout -p'

#-- logs
abbr -a glogp   'git log -p'
abbr -a gloga   'glog --all'

abbr -a gss!    'git status'
abbr -a gss     'git status -sb'
abbr -a gs      'git show --show-signature'

abbr -a gd      'git diff'
abbr -a gds     'git diff --cached'

abbr -a gcp     'git cherry-pick'
abbr -a gcpa    'git cherry-pick --abort'
abbr -a gcpc    'git cherry-pick --continue'
abbr -a gm      'git merge'
abbr -a gma     'git merge --abort'

abbr -a gl      'git pull --tags -f --rebase --autostash'
abbr -a gp      'git push -u'
abbr -a gpf     'git push -u --force-with-lease'
abbr -a gpf!    'git push -u --force'

#-- remote
abbr -a gf      'git fetch --tags'
abbr -a gu      'git fetch --tags origin main:main'

abbr -a gra     'git remote add'
abbr -a grr     'git remote remove'
abbr -a grv     'git remote -v'

abbr -a grba    'git rebase --abort'
abbr -a grbc    'git rebase --continue'
abbr -a grbi    'git rebase -i'
abbr -a grbm    'git rebase -i main'
abbr -a grbom   'git rebase -i origin/main'

abbr -a gr      'git reset'
abbr -a gr!     'git reset --hard'
abbr -a grh     'git reset HEAD'
abbr -a grh!    'git reset --hard HEAD'

#-- misc
abbr -a gcl     'git clone --depth 1'

abbr -a gbsb    'git bisect bad'
abbr -a gbsg    'git bisect good'
abbr -a gbsr    'git bisect reset'
abbr -a gbss    'git bisect start'

#-- submodules
abbr -a gsa     'git submodule add'
abbr -a gsu     'git submodule update --remote'
abbr -a gsr     'git submodule-remove'

alias gbda 'git branch --merged | grep -vE "^(\*|\s*(main|master|develop|dev)\s*\$)" | xargs -n 1 echo'
alias gbo  'git branch --set-upstream-to=origin/$(git symbolic-ref --short HEAD) $(git symbolic-ref --short HEAD)'
alias gbu  'git branch --set-upstream-to=upstream/$(git symbolic-ref --short HEAD) $(git symbolic-ref --short HEAD)'
alias glog 'git log --graph --pretty="%Cred%h%Creset%C(yellow)%d%Creset %s %Cgreen(%cr) %C(blue)<%an>%Creset" --abbrev-commit'

function read_
	cat ~/.config/fish/conf.d/git.fish |
	rg '^[a]\w+\s[^_]+' |
	sed -E "s/^.*\s(g\w+)([!]?)\s+(['])(.*)(['])\$/\
	$(set_color cyan --italic)\1$(set_color normal)$(set_color red --bold)\2\
	$(set_color normal)$(set_color brblack): \
	$(set_color blue)\3$(set_color magenta)\4$(set_color blue)\5 \
	/" |
	bat  --style=plain --theme Coldark-Dark |
	less;
end
alias _ga 'read_'
