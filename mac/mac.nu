$env.PATH = (
    $env.PATH | split row (char esep)
    | append '/usr/local/bin'
    | append '~/nodejs/node_global/bin/'
    | append '~/.pyenv/shims'
    | append '/opt/homebrew/bin/'
    | append '/usr/bin'
    | append '/usr/sbin'
)
$env.config.buffer_editor = "code"
$env.config.show_banner = false
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

def hnpush [branch] {
    match $branch {
        'master' => {git push origin HEAD:refs/for/master}
        _ => {git push origin $'HEAD:refs/for/ocp-fe_1-0-($branch)_BRANCH'}
    }
}
alias hnpull = git pull --rebase --autostash

def --env proxy [port = 7890 --cancel(-c)] {
  if $cancel {
    $env.HTTP_PROXY = ''
    $env.HTTPS_PROXY = ''
    $env.All_PROXY = ''
    return
  }
  $env.HTTP_PROXY = $'http://127.0.0.1:($port)'
  $env.HTTPS_PROXY = $'http://127.0.0.1:($port)'
  $env.All_PROXY = $'socks5://127.0.0.1:($port)'
}