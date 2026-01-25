# debian vs freesbd
root@debsid:~# wrk -t12 -c400 -d5s http://localhost
Running 5s test @ http://localhost
  12 threads and 400 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     1.07ms    1.70ms  26.36ms   86.37%
    Req/Sec    77.54k    10.30k  155.35k    85.62%
  4689584 requests in 5.09s, 1.05GB read
#speed Requests/sec: 921407.57 
Transfer/sec:    211.77MB
PRETTY_NAME="Debian GNU/Linux forky/sid"
NAME="Debian GNU/Linux"
VERSION_CODENAME=forky
ID=debian
HOME_URL="https://www.debian.org/"
SUPPORT_URL="https://www.debian.org/support"
BUG_REPORT_URL="https://bugs.debian.org/"
root@debsid:~# uname -a
Linux debsid 6.18.5+deb14-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.18.5-1 (2026-01-16) x86_64 GNU/Linux

────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
root@freebsd:~ #  wrk -t12 -c400 -d5s http://localhost
Running 5s test @ http://localhost
  12 threads and 400 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    43.43ms  116.58ms   1.46s    89.51%
    Req/Sec    54.98k    14.92k  113.87k    79.30%
  3277541 requests in 5.10s, 778.29MB read
#speed Requests/sec: 642681.81
Transfer/sec:    152.61MB
FreeBSD freebsd 15.0-STABLE FreeBSD 15.0-STABLE stable/15-n281866-eb9c65a3d60b GENERIC amd64