# Copyright (c) 2014 Midokura Europe SARL, All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License. You may obtain
# a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations
# under the License.

from midonetclient import vendor_media_type
from midonetclient.admin_state_up_mixin import AdminStateUpMixin
from midonetclient.resource_base import ResourceBase

class LoadBalancer(ResourceBase, AdminStateUpMixin):
    """The load balancer JSON model of the L4LB feature.
    """

    media_type = vendor_media_type.APPLICATION_LOAD_BALANCER_JSON

    def __init__(self, uri, dto, auth):
        super(LoadBalancer, self).__init__(uri, dto, auth)

    def get_id(self):
        return self.dto['id']

    def get_router_id(self):
        return self.dto['routerId']

    def router_id(self, router_id):
        self.dto['routerId'] = router_id
        return self
