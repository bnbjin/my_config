#! /bin/bash


ssh -i ~/.ssh/id_rsa -NfL 3333:localhost:2222 user_on_cloud@ip_of_cloud

#ssh -i ~/.ssh/id_rsa -p 3333 user_on_workdesktop@localhost
