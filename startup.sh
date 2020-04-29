#!/bin/bash

echo ''
echo 'running startup shell...'
echo ''
OUTFILE=/root/.bashrc
(
cat <<'EOF'

set -o vi
alias d="ls -CaF"
EOF
) >> $OUTFILE


OUTFILE=/usr/local/bin/run-certbot.sh
(
cat <<'EOF'
#!/bin/bash
certbot certonly --manual --manual-public-ip-logging-ok --preferred-challenges dns-01 \
 --server https://acme-v02.api.letsencrypt.org/directory -d "*.ops.packet.net" -d ops.packet.net

EOF
) >> $OUTFILE
chmod u+x /usr/local/bin/run-certbot.sh

OUTFILE=/usr/local/bin/save-before-exit.sh
(
cat <<'EOF'
#!/bin/bash

echo 'saving off the contents of "/etc/letsencrypt" to a tar file on /local-etc'
echo ''
cd /etc; tar cvf /local-etc/all-etc-letsencrypt-packet-net.tar ./letsencrypt

EOF
) >> $OUTFILE
chmod u+x /usr/local/bin/save-before-exit.sh

echo 'When ready please run the command:'
echo ''
echo 'run-certbot.sh'
echo ''
echo 'You may examine this file at /usr/local/bin if you wish to review it first.'
echo ''
echo 'After the certbot command runs correctly, we need to save the generated output data'
echo 'before exiting this container.'
echo 'NB: do not exit this container before you run the following command:'
echo ''
echo 'save-before-exit.sh'
echo ''
echo 'Verify that the file all-etc-letsencrypt-packet-net.tar '
echo 'exists in local-etc'
echo ''

exec "$@"
