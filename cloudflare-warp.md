
#fedora add repo
sudo curl -o /etc/yum.repos.d/cloudflare-warp.repo \
https://pkg.cloudflareclient.com/cloudflare-warp-ascii.repo

cat /etc/yum.repos.d/cloudflare-warp.repo

sudo dnf makecache
sudo dnf install cloudflare-warp

sudo systemctl enable --now warp-svc
systemctl status warp-svc
warp-cli registration new
warp-cli connect
warp-cli status
curl https://www.cloudflare.com/cdn-cgi/trace | grep warp


warp-cli dns families off
