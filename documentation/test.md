# Networking

- [1. ![badge](https://img.shields.io/badge/Optional-yellow) Property `Networking > subnetworks`](#subnetworks)
  - [1.1. ![badge](https://img.shields.io/badge/Required-blue) Property `Networking > subnetworks > ip_cidr_range`](#subnetworks_ip_cidr_range)
  - [1.2. ![badge](https://img.shields.io/badge/Optional-yellow) Property `Networking > subnetworks > name`](#subnetworks_name)
  - [1.3. ![badge](https://img.shields.io/badge/Optional-yellow) Property `Networking > subnetworks > description`](#subnetworks_description)

**Title:** Networking

| Type                      | `object`                                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

| Property                       | Pattern | Type   | Deprecated | Definition                   | Title/Description                           |
| ------------------------------ | ------- | ------ | ---------- | ---------------------------- | ------------------------------------------- |
| - [subnetworks](#subnetworks ) | No      | object | No         | In #/definitions/subnetworks | Subnetworks to be configured within GCP VPC |
|                                |         |        |            |                              |                                             |

## <a name="subnetworks"></a>1. ![badge](https://img.shields.io/badge/Optional-yellow) Property `Networking > subnetworks`

| Type                      | `object`                                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Defined in**            | #/definitions/subnetworks                                                                                           |
|                           |                                                                                                                     |

**Description:** Subnetworks to be configured within GCP VPC

| Property                                       | Pattern | Type   | Deprecated | Definition | Title/Description                                                                    |
| ---------------------------------------------- | ------- | ------ | ---------- | ---------- | ------------------------------------------------------------------------------------ |
| + [ip_cidr_range](#subnetworks_ip_cidr_range ) | No      | string | No         | -          | IP space allocated to this subnetwork in CIDR format.                                |
| - [name](#subnetworks_name )                   | No      | string | No         | -          | if this field is not provided ip_cidr_range value will be dynamically generated  ... |
| - [description](#subnetworks_description )     | No      | string | No         | -          | Description of this subnetwork.                                                      |
|                                                |         |        |            |            |                                                                                      |

### <a name="subnetworks_ip_cidr_range"></a>1.1. ![badge](https://img.shields.io/badge/Required-blue) Property `Networking > subnetworks > ip_cidr_range`

| Type                      | `string`                                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Description:** IP space allocated to this subnetwork in CIDR format.

| Restrictions                      |                                                                                                                                                                                                                                         |
| --------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Must match regular expression** | ```^([0-9]{1,3}\.){3}[0-9]{1,3}\/(([0-9]\|[1-2][0-9]\|3[0-2]))?$``` [Test](https://regex101.com/?regex=%5E%28%5B0-9%5D%7B1%2C3%7D%5C.%29%7B3%7D%5B0-9%5D%7B1%2C3%7D%5C%2F%28%28%5B0-9%5D%7C%5B1-2%5D%5B0-9%5D%7C3%5B0-2%5D%29%29%3F%24) |
|                                   |                                                                                                                                                                                                                                         |

### <a name="subnetworks_name"></a>1.2. ![badge](https://img.shields.io/badge/Optional-yellow) Property `Networking > subnetworks > name`

| Type                      | `string`                                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `null`                                                                                                              |
|                           |                                                                                                                     |

**Description:** if this field is not provided ip_cidr_range value will be dynamically generated based on the ip_cidr_range. WARNING, if this field is not set changing the ip_cidr_range will change the name dynamically generated.

| Restrictions                      |                                                                                                                                                                   |
| --------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Must match regular expression** | ```^(?:[a-z](?:[-a-z0-9]{0,61}[a-z0-9])?)$``` [Test](https://regex101.com/?regex=%5E%28%3F%3A%5Ba-z%5D%28%3F%3A%5B-a-z0-9%5D%7B0%2C61%7D%5Ba-z0-9%5D%29%3F%29%24) |
|                                   |                                                                                                                                                                   |

### <a name="subnetworks_description"></a>1.3. ![badge](https://img.shields.io/badge/Optional-yellow) Property `Networking > subnetworks > description`

| Type                      | `string`                                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `null`                                                                                                              |
|                           |                                                                                                                     |

**Description:** Description of this subnetwork.

----------------------------------------------------------------------------------------------------------------------------
Generated using [json-schema-for-humans](https://github.com/coveooss/json-schema-for-humans) on 2021-10-11 at 17:04:37 -0700