*** Settings ***
Documentation       This is the starting file

Library             factories/partner.py
Library             factories/customer.py

Resource            database.robot
Resource            services.robot
Resource            helpers.robot

