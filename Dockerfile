FROM php:8.2-apache

# Install necessary software
RUN apt-get update && \
    apt-get -y install cron nano bash

# Add crontab file
COPY crontab /etc/cron.d/crontab

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/crontab

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

# Start the cron service
CMD cron && tail -f /var/log/cron.log 
