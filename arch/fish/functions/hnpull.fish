function hnpull
    set -l branch $argv[1]
    if test -z "$branch"
        git pull --rebase --autostash
    else
        git pull origin "$branch" --rebase --autostash
    end
end