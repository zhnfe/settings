$env.PATH = (
    $env.PATH | split row (char esep)
    | append '/usr/local/bin'
    | append '~/nodejs/node_global/bin/'
    | append '~/.pyenv/shims'
    | append '/opt/homebrew/bin/'
    | append '/usr/bin'
)
# oh my posh
source ~/.oh-my-posh.nu

# 别名
alias s = npm run serve
alias d = npm run dev
alias ll = ls -l
alias la = ls -a
# 环境变量
$env.LS_COLORS = "di=01;96:ln=00;95:*.js=00;32:*.ts=00;32"
$env.HOMEBREW_API_DOMAIN = 'https://mirrors.ustc.edu.cn/homebrew-bottles/api'
$env.HOMEBREW_BOTTLE_DOMAIN = 'https://mirrors.aliyun.com/homebrew/homebrew-bottles'
$env.HOMEBREW_CELLAR = '/opt/homebrew/Cellar'
$env.HOMEBREW_PIP_INDEX_URL = 'https://mirrors.aliyun.com/pypi/simple/'
$env.HOMEBREW_PREFIX = '/opt/homebrew'
$env.HOMEBREW_REPOSITORY = '/opt/homebrew'



# git 相关
def hnpush [version] {
    if $version == 'master' {
        git push origin HEAD:refs/for/master
        return
    }
    git push origin $'HEAD:refs/for/ocp-fe_1-0-($version)_BRANCH'
}

alias hnpull = git pull --rebase --autostash