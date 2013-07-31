# Introduction

Since Rudder 2.7.0, We have added a Rest API to Rudder. That API Allow you to interact with Rudder without using the webapp.

## Authentication

To allow usage of that API, you need to be authenticated. Rudder may contains capital informations about your IT, and we don't want those informations to be public.

You need to be authenticated using an API Account. Those accounts can be created in Rudder, the 'API Accounts' page located inside the Administration part.

![Rudder API page](../APISettings.png "Rudder API Settings page")

Once you have created an API Account, you can now use the API. A token is generated for all accounts and you will need that token to authenticate while using the API

For any call to API, you will need to add a **_X-API-Token_** header to your request

	curl -X XXX http://serverRudder/rudder/api/function -H "X-API-Token: yourToken"

If you perform any action (Creation,Update,Deletion) using the API, the event log generated will have the API account as actor

## Versionning

## Response format

## General Parameters