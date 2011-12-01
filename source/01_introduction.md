# Radium API DOCUMENTATION

The Radium API is designed around [REST](http://en.wikipedia.org/wiki/Representational_State_Transfer).
The API is designed to be predictable and fast. HTTP verbs are used to
indicate what action to do on a particiular resource. HTTP status codes
are use to indicate the results. All response are given back in
[JSON](http://www.json.org/). All requests happen over HTTPS to ensure
security. All requests can be sent either as JSON or as standard URL
encoded form bodies.

The API is designed only allows you act like the user you are logged in
as. System wide access is not allowed. 

You will need two things to start using the API.

1. A Developer API key. This is your authentication token. We will
   monitor use of this specific token. Every application should have
   their own unique token. This token is sent with every HTTP request.
2. A User API key. This token is globally unique through out Radium.
   This allows you to complete actions as the user indentified by this
   token. This token never changes. You can use your developer API key
   to retreive user API keys.

The API is designed to be developer friendly for many different HTTP
clients in any different langauge or framework. You should have no
problem using the API has long as your library can:

1. Send `GET`, `POST`, `PUT`, and `DELETE` requests
2. Set headers on individual requests
3. Conduct HTTP authorization.

Now that you know the basic of what you need to use the API's, let's go
over developer and user authentication. The server with authorize
requests baised on the resource, user, and action requested. You have no
control over the authorization process. You can simply authenticate to
the server.

## Authentication

The API has been designed to allow multiple ways to authenticate. It is
designed this way because the authentication information should sent
with every request. Different HTTP libraries allow you to configure them
to do so but in different ways. The API is designed support a few common
scenarios.

1. Authentication by query string paramters. EX:
   `/foo?developer_api_key=bar&user_api_key=baz`
2. HTTP authorization. EX:
   `https://developer_api_key@user_api_key:api.radiumcrm.com`
3. Request Headers. EX `X-Radium-Developer-API-Key: foo`
4. Form body paramters.

Refer to your librarie's documentation to determine which authentication
strategy is right for your application.

## Parameter Parsing

The API is designed to work these formats:

1. `application/json` **RECOMMENDED**
2. `application/x-www-form-urlencoded`
3. `multipart/form-data` (for uploading Attachments and other files)

Sending parameters as JSON encoded objects is the preferred and
recommend way to interact with the API. JSON makes it easier to model
some larger structures required by the API. The examples are also
modeled using a JSON encoded object for input parameters and a JSON
encoded object for output. Your HTTP library should be able to use any
of these formats, however it may not automatically encode JSON for you
so besure you know your HTTP library inside and out!

## HTTP Response Codes

The API returns status codes to describe what happens for the particular
response. Response codes are listed per individual request as well. 
This section is here to give you a overview of what the API returns and
how to interpert it.

<dl>
  <dt>200</td>
  <dd>Success. Pip-pip jolly good fun ol' bean. Everything went
  according to plan.</dd>

  <dt>201</td>
  <dd>Created. Used when a POST to create a resource was
  successfull</dd>

  <dt>202</td>
  <dd>Accepted. Used when a requests enter a queuing system. They are
  processed later and my succeded or fail at that time. If you request
  returns a 202 it should be considered a success.</dd>

  <dt>401<td>
  <dd>Unauthorized. Used when could not authenticate using the developer
  or user token. This is either because the tokens were not provided,
  provided incorrectly, or simply wrong.</dd>

  <dt>402</dt>
  <dd>Payment Required. Used when authentication happened correctly, but
  the request requires a UBB (Usage Based Billing) service that the user
  does not have enough credit for.</dd>

  <dt>403</dt>
  <dd>Forbidden. Use when authentication happened correctly, but the
  user does not have access to complete that action on the specific
  resource. Example, try to delete a user from a different account.</dd>

  <dt>404</dt>
  <dd>Not Found. Used when you the specified record could not be found
  in the system. This error will be raised if you try to access records
  outside the scope of the user's account or specify the ID incorrectly.
  Example, specify id is 5 when there is no Todo with id 5.</dd>

  <dt>405</dt>
  <dd>Method Not Allowed. Used when specific URL requires a POST but
  request comes as a GET.</dd>

  <dt>406</dt>
  <dd>Not Acceptable. Used then the API does not know how to generate a
  response for the specified format. Example, requesting XML when the
  API only returns JSON.</dd>

  <dt>422</dt>
  <dd>Unprocessable Entity (aka Validation Failed). Used for all
  responses that fail to update records for validation resasons or there
  was a problem with the input paramters. See the response body for a
  list of errors.</dd>

  <dt>429</dt>
  <dd>Too Many Requests. Application is over the rate limit for the
  specified developer.</dd>


  <dt>500</dt>
  <dd>Internal Server Error. Returned when an exception is raised on the
  server. This is usually because a bug has occured. 500 responses are
  automatically sent to admins for debugging. This means there is a
  problem with the server and not your application.</dd>

  <dt>502</dt>
  <dd>Bad Gateway. Used when an external server is needed to complete a
  request and it returned an error.</dd>

  <dt>503</dt>
  <dd>Down for maintenance. This is a temporary state.</dd>
</dl>

## Resources

The API grants you access to all the fundamental resources in Radium.
You should easily be able to use all these resources to create your own
rich Application based off on the Radium platform. I'll give you
a quick list of all the different things you can access. Refer to the
individual sections for complete indepth disscussion of each resource
and how it relates to the others.

1. Users
2. Contacts
3. Groups
4. Emails
5. SMS
6. IM
7. Todos
8. Call Lists
10. Deals
11. Phone Calls
12. Meetings
13. External Accounts (Microsoft Exchange & Google)
9. Campaigns
14. Lead Capture
15. Attachments
16. Comments

Each resource allows for basic CRUD (Create, Read, Update, and Delete)
operations plus some specific actions for individual resources. For
example, you can CRUD meetings as well as confirm or reject them. Basic
CRUD operations give you (the developer) full control of the lifecyle of
individual records.

## Push Notifications

The platform will also send push notifications for changes to each
record as well as specific events related to each record. For example,
you may receive a `deal_closed` event. You can use a [Websocket](http://dev.w3.org/html5/websockets/)
or a few other socket protocols to connect to the notification server.
You should listen for notifications to keep your application's data up
to date as it changes in real time. Authentication and listening is
slitghtly different for push notifications. Refer to the push
notification section for indepth discussion.

## Help & Support

IF you are having a prolem using or understanding **after having read
the documentation** please email: [api-support@radiumcrm.com](mailto:
api-support@radiumcrm.com). Someone will get back to you ASAP. If you
happen to run into Adam Hawkins anywhere like on the street, in the
club, on the beach, in Europe, in California, in Asia, or at a
conference, or up in your codez, please give him a shout! He'd love to
hear from you. 
