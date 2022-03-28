import basicSchema from './basic.schema.json';
import advancedSchema from './advanced.schema.json';

const resolvedSchema = (isBasicSchema = true) => ({
    "$id": "networks.schema.json",
    "$schema": "http://json-schema.org/draft-07/schema#",
    "title": "Networks",
    "type": "array",
    "widget": "GenericList",
    "items": {
        "title": "Network",
        "description": "A Virtual Private Cloud (VPC) network implemented inside of Google's production network",
        "type": "object",
        "widget": "Accordions",
        "additionalProperties": true,
        "required": [
            "name"
        ],
        "properties": {
            "label": {},
            "name": {
                "title": "Name",
                "description": "This field will be used be combine with [environment] and [prefix] to generate a unique VPC name",
                "type": "string",
                "examples": [{
                        "name": "alpha",
                        "subnetworks": "......",
                        "routes": "......",
                        "firewall_rules": "....."
                    },
                    {
                        "name": "bravo",
                        "subnetworks": "......",
                        "routes": "......",
                        "firewall_rules": "....."
                    }
                ]
            },
            "project_id": {
                "title": "Project ID",
                "description": "To be implemented",
                "readOnly": true,
                "$comment": "To be implemented"
            },
            "description": {
                "title": "Description",
                "description": "Description to be used for the created Network",
                "type": "string"
            },
            ...(isBasicSchema && {
                ...basicSchema
            } || {
                ...advancedSchema
            })
        }
    },
    "examples": [
        [{
            "name": "network-single",
            "description": "This will create a single VPC Network and nothing else"
        }],
        [{
                "name": "network-alpha",
                "description": "This will create a network alpha and nothing else"
            },
            {
                "name": "network-bravo",
                "description": "This will create a network bravo and nothing else"
            }
        ],
        [{
            "name": "subnetwork-secondary-subnetworks",
            "description": "This will create a single VPC Network, Primary Subnetwork and two Secondary Ranges",
            "subnetworks": [{
                "region": "US-EAST4",
                "ip_cidr_range": "172.16.0.0/24",
                "secondary_subnetworks": [{
                        "ip_cidr_range": "172.16.1.0/24"
                    },
                    {
                        "ip_cidr_range": "172.16.2.0/24"
                    }
                ]
            }]
        }],
        [{
            "name": "cloud-nat-all",
            "description": "This will create a single VPC Network with Primary and Secondary Subnetworks with Cloud-NAT",
            "routing_mode": "GLOBAL",
            "cloud_nat": {
                "subnetworks_to_nat": "ALL_PRIMARY_SUBNETWORKS_ALL_SECONDARY_SUBNETWORKS"
            },
            "subnetworks": [{
                "region": "US-WEST1",
                "ip_cidr_range": "172.16.32.0/24",
                "secondary_subnetworks": [{
                        "ip_cidr_range": "10.20.32.0/24"
                    },
                    {
                        "ip_cidr_range": "10.20.33.0/24"
                    }
                ]
            }]
        }]
    ]
});

export default resolvedSchema;