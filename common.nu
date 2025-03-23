$env.config.buffer_editor = 'code'
$env.config.show_banner = false

# 别名
alias s = npm run serve
alias d = npm run dev
alias p = npm run preview
alias ll = ls -l
alias la = ls -a

def hnpull [branch: string = ''] {
    if $branch == '' {
        git pull --rebase --autostash
    } else {
        git pull origin $branch --rebase --autostash
    }
}

# 设置代理, 默认端口7890
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

def deploy-zhnme [] {
    pnpm build --envName zhnme
    tar -zcf output.tar.gz .output
    scp ./output.tar.gz ubuntu@2406:da18:495:d609:b1af:d2f2:8dd4:2447:/home/ubuntu/zhnme/
}
