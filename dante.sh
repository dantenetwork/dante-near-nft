#!/bin/bash
delete()
{
    near delete nft.georgecross.testnet georgecross.testnet
}

deploy()
{
    near create-account nft.georgecross.testnet --masterAccount georgecross.testnet --initialBalance 30
    near deploy nft.georgecross.testnet --wasmFile ./res/non_fungible_token.wasm
}

init()
{
    near call nft.georgecross.testnet new '{
        "owner_id":"georgecross.testnet",
        "metadata":{
            "spec":"nft-1.0.0",
            "name":"Dante World Tree",
            "symbol":"DNFT",
            "icon":"data:image/svg+xml,%3Csvg version=\"1.1\" id=\"1\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" x=\"0px\" y=\"0px\" viewBox=\"0 0 1024 1024\" style=\"enable-background:new 0 0 1024 1024;\" xml:space=\"preserve\"%3E%3Cstyle type=\"text/css\"%3E .st0%7Bfill:%2300B6DE;%7D%0A%3C/style%3E%3Cg%3E%3Cg%3E%3Cpath class=\"st0\" d=\"M445.22,589c-3.86,1.42-10.68,3.45-26.9,5.66c-27.29,3.73-49.91,2.84-65.12,1.42l28.31-169.88h49.55 c6.57-0.3,15.59,0.07,25.75,3c19.56,5.64,31.95,17.46,37.56,23.61c31.54-0.99,63.09-1.97,94.63-2.96 c-2.84-14.84-9.58-37.71-27.08-59.23c-44.41-54.6-117.68-50.8-126.69-50.19h-103.5l-59.14,354.86 c31.76,2.98,79.03,4.83,136.03-2.96c26.31-3.6,39.82-5.39,56.19-11.83c65.28-25.71,97.81-85.88,106.46-103.5 c4.24-8.62,7.12-15.96,8.87-20.7c-30.56,0-61.12,0-91.67,0C480.91,566.1,467,580.98,445.22,589z\"/%3E%3C/g%3E%3Cg%3E%3Cpath class=\"st0\" d=\"M586.05,532.66c-29.57,0-59.14,0-88.72,0c1.97-18.73,3.94-37.46,5.91-56.19h88.72 C589.99,495.2,588.02,513.93,586.05,532.66z\"/%3E%3Crect x=\"615.62\" y=\"443.95\" class=\"st0\" width=\"68.02\" height=\"47.32\"/%3E%3Crect x=\"609.71\" y=\"520.83\" class=\"st0\" width=\"68.02\" height=\"47.32\"/%3E%3Crect x=\"704.34\" y=\"476.48\" class=\"st0\" width=\"44.36\" height=\"38.44\"/%3E%3Crect x=\"766.44\" y=\"448.28\" class=\"st0\" width=\"32.53\" height=\"28.19\"/%3E%3Crect x=\"788.95\" y=\"487.02\" class=\"st0\" width=\"32.53\" height=\"28.19\"/%3E%3C/g%3E%3C/g%3E%3C/svg%3E"
        }
    }' --accountId georgecross.testnet
}

mint()
{
    near call nft.georgecross.testnet nft_mint '{"token_id":"1","receiver_id":"georgecross.testnet","token_metadata":{"title":"dante_title","description":"nft_description","media":"https://ipfs.io/ipfs/QmdUySjLw9AWtgirvevLVKsn2JPZK3vfWvhX5c81s2jCM3?filename=1.png"}}' --accountId georgecross.testnet --deposit 1
}

help()
{
cat << EOF
Usage: dante <command>

Commands:
    delete             delete contract
    deploy             deploy contract
    init               init contract
    help               display help
EOF
}

case "$1" in
    delete)
        delete
        ;;
    deploy)
        deploy
        ;;
    init)
        init
        ;;
    mint)
        mint
        ;;
    *)
        help
esac
exit 0
