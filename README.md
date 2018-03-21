# Smart Proxy - Spacewalk

This plug-in adds support for communicating with a Spacewalk server (i.e. RedHat Satellite 5, Suse Manager) to Foreman's Smart Proxy. The [Foreman Spacewalk plugin](https://github.com/dm-drogeriemarkt/foreman_spacewalk) plug-in needs to be installed in Foreman itself for the integration to work properly.

## Compatibility

| Foreman Proxy Version | Plugin Version |
| --------------------- | -------------- |
| >= 1.15               | any            |

## Installation

You need to install the [Foreman Spacewalk plugin](https://github.com/dm-drogeriemarkt/foreman_spacewalk) and install this smart-proxy plugin.

For the Smart Proxy plugin, follow the [smart-proxy plugin installation instructions](http://projects.theforeman.org/projects/foreman/wiki/How_to_Install_a_Smart-Proxy_Plugin). You usually just need to install the `rubygem-smart_proxy_spacewalk` package, configure it and restart the `foreman-proxy` service.

Do not forget to register the smart proxy in Foreman via the user interface.

## Copyright

Copyright (c) 2018 dm-drogerie markt GmbH & Co. KG, https://dm.de

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
