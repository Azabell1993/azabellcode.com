ls -ld /var/www/azabellcode.com/minishell_space
ls -l /home/azabell/emsdk/node/20.18.0_64bit/bin/node
ls -l /var/www/azabellcode.com/daemon/minishell_node.js

sudo chown -R azabell:azabell /var/www/azabellcode.com
sudo chmod -R 750 /var/www/azabellcode.com

sudo systemctl restart minishell.service
sudo systemctl restart myweb.service
sudo systemctl restart apache2