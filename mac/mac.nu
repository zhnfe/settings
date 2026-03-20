$env.PATH = (
    [
        '/usr/local/bin',
        '/opt/homebrew/bin/',
        '~/nodejs/node_global/bin/',
        '~/.pyenv/shims',
        '~/.bun/bin'
        '/usr/bin',
        '/usr/sbin'
    ] | append ($env.PATH | split row (char esep)) | uniq
)

# oh my posh
source ~/.oh-my-posh.nu
source ../common.nu
alias python3 = python

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
        'master' => {git push origin main}
        _ => {git push origin $'HEAD:refs/for/ocp-fe_1-0-($branch)_BRANCH'}
    }
}

def fcnap-push [token = 'local'] {
    $env.UPLOADER_ENVIRONMENT_TOKEN = match $token {
        'local' => '7aadac5e52'
        'tpl' => 'e17fe93a30'
        'guohui' => '87e60e9fad'
        _ => ''
    }
    cd ~/Documents/code/baidu/ps-se-fe-tpl/ocp-fe
    pnpm build:dev
    f-upload ./dist
}

def my-upload [token = 'local'] {
    $env.FCNAP_TOKEN = match $token {
        'local' => '7aadac5e52'
        'tpl' => 'e17fe93a30'
        'guohui' => '87e60e9fad'
        _ => token
    }
    cd ~/Documents/code/baidu/ps-se-fe-tpl/ocp-fe
    pnpm build:dev
    my-fupload ./dist
}
