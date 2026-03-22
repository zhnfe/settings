function dl
    argparse 'c/cancel' 'p/port=' -- $argv
    set port (if set -q _flag_port; echo $_flag_port; else; echo 7890; end)

    if set -q _flag_cancel
        set -e HTTP_PROXY
        set -e HTTPS_PROXY
        set -e ALL_PROXY
        echo "✅ Proxy environment variables cleared."
        return
    end

    set -gx HTTP_PROXY "http://127.0.0.1:$port"
    set -gx HTTPS_PROXY "http://127.0.0.1:$port"
    set -gx ALL_PROXY "socks5://127.0.0.1:$port"
    echo "🚀 Proxy set to 127.0.0.1:$port"
end