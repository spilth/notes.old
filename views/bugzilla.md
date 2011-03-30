# Bugzilla

http://www.bugzilla.org/

http://www.bugzilla.org/docs/4.0/en/html/upgrade.html

* Bugzilla runs with Perl 5.8.1, but it's a good idea to be using the latest stable version. 
* Bugzilla supports MySQL, PostgreSQL and Oracle as database servers.
* Pretty much any web server that is capable of running CGI scripts will work.

## Required Perl Modules

* CGI (3.51)
* Date::Format (2.21)
* DateTime (0.28)
* DateTime::TimeZone (0.71)
* DBD::mysql (4.00) if using MySQL
* DBD::Oracle (1.19) if using Oracle
* DBD::Pg (1.45) if using PostgreSQL
* DBI (1.41)
* Digest::SHA (any)
* Email::MIME (1.904)
* Email::Send (2.00)
* Template (2.22)
* URI (any) 

## Optional Perl Modules

* Authen::Radius (any) for RADIUS Authentication
* Authen::SASL (any) for SASL Authentication
* Chart::Lines (2.1) for bug charting
* Daemon::Generic (any) for Mail Queueing
* Email::MIME::Attachment::Stripper (any) for Inbound Email
* Email::Reply (any) for Inbound Email
* GD (1.20) for bug charting
* GD::Graph (any) for bug charting
* GD::Text (any) for bug charting
* HTML::Parser (3.40) for More HTML in Product/Group Descriptions
* HTML::Scrubber (any) for More HTML in Product/Group Descriptions
* JSON::RPC (any) for the JSON-RPC interface
* LWP::UserAgent (any) for Automatic Update Notifications
* MIME::Parser (5.406) for bug import/export
* mod_perl2 (1.999022) for mod_perl
* Net::LDAP (any) for LDAP Authentication
* PatchReader (0.9.4) for pretty HTML view of patches
* SOAP::Lite (0.712) for the web service interface
* Template::Plugin::GD::Image (any) for Graphical Reports
* Test::Taint (any) for the web service interface
* TheSchwartz (any) for Mail Queueing
* XML::Twig (any) for bug import/export
