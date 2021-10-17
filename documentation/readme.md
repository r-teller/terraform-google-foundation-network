# Networks

**Title:** Networks

| Type                      | `array of object`                                                                                                   |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

|                      | Array restrictions |
| -------------------- | ------------------ |
| **Min items**        | N/A                |
| **Max items**        | N/A                |
| **Items unicity**    | False              |
| **Additional items** | False              |
| **Tuple validation** | See below          |
|                      |                    |

| Each item of this array must be | Description |
| ------------------------------- | ----------- |
| [items](#items)                 | -           |
|                                 |             |

## <a name="items"></a>1. Networks > items

| Type                      | `object`                                                                                         |
| ------------------------- | ------------------------------------------------------------------------------------------------ |
| **Additional properties** | [![badge](https://img.shields.io/badge/Not+allowed-red)](# "Additional Properties not allowed.") |
|                           |                                                                                                  |

| Property                                                           | Pattern | Type              | Deprecated | Definition                                          | Title/Description |
| ------------------------------------------------------------------ | ------- | ----------------- | ---------- | --------------------------------------------------- | ----------------- |
| + [name](#items_name )                                             | No      | string            | No         | -                                                   | -                 |
| - [description](#items_description )                               | No      | string or null    | No         | -                                                   | -                 |
| - [mtu](#items_mtu )                                               | No      | enum (of integer) | No         | -                                                   | -                 |
| - [private_google_access](#items_private_google_access )           | No      | enum (of string)  | No         | -                                                   | -                 |
| - [private_service_connection](#items_private_service_connection ) | No      | Combination       | No         | -                                                   | -                 |
| - [routing_mode](#items_routing_mode )                             | No      | enum (of string)  | No         | -                                                   | -                 |
| - [subnetworks](#items_subnetworks )                               | No      | array of object   | No         | In subnetworks.schema.json#/definitions/subnetworks | -                 |
| - [cloud_nat](#items_cloud_nat )                                   | No      | object            | No         | In cloud_nat.schema.json#/definitions/cloud_nat     | -                 |
| - [peers](#items_peers )                                           | No      | array of object   | No         | -                                                   | -                 |
|                                                                    |         |                   |            |                                                     |                   |

<details>
<summary><strong> <a name="items_name"></a>1.1. [Required] Property Networks > items > name</strong>  

</summary>
<blockquote>

| Type                      | `string`                                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

</blockquote>
</details>

<details>
<summary><strong> <a name="items_description"></a>1.2. [Optional] Property Networks > items > description</strong>  

</summary>
<blockquote>

| Type                      | `string or null`                                                                                                    |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `null`                                                                                                              |
|                           |                                                                                                                     |

</blockquote>
</details>

<details>
<summary><strong> <a name="items_mtu"></a>1.3. [Optional] Property Networks > items > mtu</strong>  

</summary>
<blockquote>

| Type                      | `enum (of integer)`                                                                                                 |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `1460`                                                                                                              |
|                           |                                                                                                                     |

Must be one of:
* 1460
* 1500

</blockquote>
</details>

<details>
<summary><strong> <a name="items_private_google_access"></a>1.4. [Optional] Property Networks > items > private_google_access</strong>  

</summary>
<blockquote>

| Type                      | `enum (of string)`                                                                                                  |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `"DISABLED"`                                                                                                        |
|                           |                                                                                                                     |

Must be one of:
* "RESTRICTED"
* "PRIVATE"
* "DISABLED"

</blockquote>
</details>

<details>
<summary><strong> <a name="items_private_service_connection"></a>1.5. [Optional] Property Networks > items > private_service_connection</strong>  

</summary>
<blockquote>

| Type                      | `combining`                                                                                                         |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

<blockquote>

| One of(Option)                                       |
| ---------------------------------------------------- |
| [item 0](#items_private_service_connection_oneOf_i0) |
| [item 1](#items_private_service_connection_oneOf_i1) |
|                                                      |

<blockquote>

#### <a name="items_private_service_connection_oneOf_i0"></a>1.5.1. Property `Networks > items > private_service_connection > oneOf > item 0`

| Type                      | `object`                                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

| Property                                                                                   | Pattern | Type    | Deprecated | Definition | Title/Description                                     |
| ------------------------------------------------------------------------------------------ | ------- | ------- | ---------- | ---------- | ----------------------------------------------------- |
| - [export_custom_routes](#items_private_service_connection_oneOf_i0_export_custom_routes ) | No      | boolean | No         | -          | -                                                     |
| - [import_custom_routes](#items_private_service_connection_oneOf_i0_import_custom_routes ) | No      | boolean | No         | -          | -                                                     |
| + [ip_cidr_range](#items_private_service_connection_oneOf_i0_ip_cidr_range )               | No      | string  | No         | -          | IP space allocated to this connection in CIDR format. |
|                                                                                            |         |         |            |            |                                                       |

<details>
<summary><strong> <a name="items_private_service_connection_oneOf_i0_export_custom_routes"></a>1.5.1.1. [Optional] Property Networks > items > private_service_connection > oneOf > item 0 > export_custom_routes</strong>  

</summary>
<blockquote>

| Type                      | `boolean`                                                                                                           |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `false`                                                                                                             |
|                           |                                                                                                                     |

</blockquote>
</details>

<details>
<summary><strong> <a name="items_private_service_connection_oneOf_i0_import_custom_routes"></a>1.5.1.2. [Optional] Property Networks > items > private_service_connection > oneOf > item 0 > import_custom_routes</strong>  

</summary>
<blockquote>

| Type                      | `boolean`                                                                                                           |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `false`                                                                                                             |
|                           |                                                                                                                     |

</blockquote>
</details>

<details>
<summary><strong> <a name="items_private_service_connection_oneOf_i0_ip_cidr_range"></a>1.5.1.3. [Required] Property Networks > items > private_service_connection > oneOf > item 0 > ip_cidr_range</strong>  

</summary>
<blockquote>

| Type                      | `string`                                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Description:** IP space allocated to this connection in CIDR format.

| Restrictions                      |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| --------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Must match regular expression** | ```^(?:([0-9]\|[1-9][0-9]{0,1}\|1[0-9]{1,2}\|2[0-4][0-9]\|25[0-5])(\.([0-9]\|[1-9][0-9]{0,1}\|1[0-9]{1,2}\|2[0-4][0-9]\|25[0-5])){3}/(([0-9]\|[1-2][0-9]\|3[0-2])))$``` [Test](https://regex101.com/?regex=%5E%28%3F%3A%28%5B0-9%5D%7C%5B1-9%5D%5B0-9%5D%7B0%2C1%7D%7C1%5B0-9%5D%7B1%2C2%7D%7C2%5B0-4%5D%5B0-9%5D%7C25%5B0-5%5D%29%28%5C.%28%5B0-9%5D%7C%5B1-9%5D%5B0-9%5D%7B0%2C1%7D%7C1%5B0-9%5D%7B1%2C2%7D%7C2%5B0-4%5D%5B0-9%5D%7C25%5B0-5%5D%29%29%7B3%7D%2F%28%28%5B0-9%5D%7C%5B1-2%5D%5B0-9%5D%7C3%5B0-2%5D%29%29%29%24&testString=%22192.168.0.0%2F24%22) |
|                                   |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |

**Example:** 

```json
"192.168.0.0/24"
```

</blockquote>
</details>

</blockquote>
<blockquote>

#### <a name="items_private_service_connection_oneOf_i1"></a>1.5.2. Property `Networks > items > private_service_connection > oneOf > item 1`

| Type                      | `object`                                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

| Property                                                                                   | Pattern | Type    | Deprecated | Definition | Title/Description                                                                    |
| ------------------------------------------------------------------------------------------ | ------- | ------- | ---------- | ---------- | ------------------------------------------------------------------------------------ |
| - [export_custom_routes](#items_private_service_connection_oneOf_i1_export_custom_routes ) | No      | boolean | No         | -          | -                                                                                    |
| - [import_custom_routes](#items_private_service_connection_oneOf_i1_import_custom_routes ) | No      | boolean | No         | -          | -                                                                                    |
| + [ip_cidr_prefix](#items_private_service_connection_oneOf_i1_ip_cidr_prefix )             | No      | integer | No         | -          | IP CIDR prefix used for this connection. Google will automtically allocated a IP ... |
|                                                                                            |         |         |            |            |                                                                                      |

<details>
<summary><strong> <a name="items_private_service_connection_oneOf_i1_export_custom_routes"></a>1.5.2.1. [Optional] Property Networks > items > private_service_connection > oneOf > item 1 > export_custom_routes</strong>  

</summary>
<blockquote>

| Type                      | `boolean`                                                                                                           |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `false`                                                                                                             |
|                           |                                                                                                                     |

</blockquote>
</details>

<details>
<summary><strong> <a name="items_private_service_connection_oneOf_i1_import_custom_routes"></a>1.5.2.2. [Optional] Property Networks > items > private_service_connection > oneOf > item 1 > import_custom_routes</strong>  

</summary>
<blockquote>

| Type                      | `boolean`                                                                                                           |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `false`                                                                                                             |
|                           |                                                                                                                     |

</blockquote>
</details>

<details>
<summary><strong> <a name="items_private_service_connection_oneOf_i1_ip_cidr_prefix"></a>1.5.2.3. [Required] Property Networks > items > private_service_connection > oneOf > item 1 > ip_cidr_prefix</strong>  

</summary>
<blockquote>

| Type                      | `integer`                                                                                                           |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Description:** IP CIDR prefix used for this connection. Google will automtically allocated a IP CIDR Range based on the provided prefix

**Example:** 

```json
16
```

</blockquote>
</details>

</blockquote>

</blockquote>

</blockquote>
</details>

<details>
<summary><strong> <a name="items_routing_mode"></a>1.6. [Optional] Property Networks > items > routing_mode</strong>  

</summary>
<blockquote>

| Type                      | `enum (of string)`                                                                                                  |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `"REGIONAL"`                                                                                                        |
|                           |                                                                                                                     |

Must be one of:
* "GLOBAL"
* "REGIONAL"

</blockquote>
</details>

<details>
<summary><strong> <a name="items_subnetworks"></a>1.7. [Optional] Property Networks > items > subnetworks</strong>  

</summary>
<blockquote>

| Type                      | `array of object`                                                                                                   |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Defined in**            | subnetworks.schema.json#/definitions/subnetworks                                                                    |
|                           |                                                                                                                     |

|                      | Array restrictions |
| -------------------- | ------------------ |
| **Min items**        | 0                  |
| **Max items**        | 100                |
| **Items unicity**    | True               |
| **Additional items** | False              |
| **Tuple validation** | See below          |
|                      |                    |

| Each item of this array must be        | Description |
| -------------------------------------- | ----------- |
| [Subnetwork](#items_subnetworks_items) | -           |
|                                        |             |

#### <a name="items_subnetworks_items"></a>1.7.1. Networks > items > subnetworks > Subnetwork

**Title:** Subnetwork

| Type                      | `combining`                                                                                                         |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

<blockquote>

| All of(Requirement)                                                 |
| ------------------------------------------------------------------- |
| [Private](#items_subnetworks_items_allOf_i0)                        |
| [Private Service Connect](#items_subnetworks_items_allOf_i1)        |
| [Internal HTTP(s) Load Balancer](#items_subnetworks_items_allOf_i2) |
|                                                                     |

<blockquote>

##### <a name="items_subnetworks_items_allOf_i0"></a>1.7.1.1. Property `Networks > items > subnetworks > Subnetwork > allOf > Private`

**Title:** Private

| Type                      | `object`                                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Description:** A subnetwork with purpose set to PRIVATE is a user-created subnetwork that is reserved for Google Compute Engine instances.

##### <a name="autogenerated_heading_2"></a>1.7.1.1.1. If (purpose = "PRIVATE")

| Type                      | `object`                                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Defined in**            | #/definitions/private                                                                                               |
|                           |                                                                                                                     |

| Property                                                                                       | Pattern | Type             | Deprecated | Definition                                 | Title/Description                                                                    |
| ---------------------------------------------------------------------------------------------- | ------- | ---------------- | ---------- | ------------------------------------------ | ------------------------------------------------------------------------------------ |
| - [name](#items_subnetworks_items_allOf_i0_then_name )                                         | No      | string           | No         | -                                          | Subnetwork Name                                                                      |
| + [ip_cidr_range](#items_subnetworks_items_allOf_i0_then_ip_cidr_range )                       | No      | string           | No         | -                                          | IP space allocated to this subnetwork in CIDR format.                                |
| - [purpose](#items_subnetworks_items_allOf_i0_then_purpose )                                   | No      | const            | No         | -                                          | -                                                                                    |
| - [description](#items_subnetworks_items_allOf_i0_then_description )                           | No      | string           | No         | -                                          | Description of this subnetwork.                                                      |
| - [secondary_subnetworks](#items_subnetworks_items_allOf_i0_then_secondary_subnetworks )       | No      | array of object  | No         | -                                          | -                                                                                    |
| - [private_ip_google_access](#items_subnetworks_items_allOf_i0_then_private_ip_google_access ) | No      | enum (of string) | No         | -                                          | (OPTIONAL) Provide access to Google Cloud APIs from this subnet for instances wi ... |
| - [log_config](#items_subnetworks_items_allOf_i0_then_log_config )                             | No      | object           | No         | -                                          | -                                                                                    |
| - [cloud_nat](#items_subnetworks_items_allOf_i0_then_cloud_nat )                               | No      | object           | No         | -                                          | -                                                                                    |
| + [region](#items_subnetworks_items_allOf_i0_then_region )                                     | No      | enum (of string) | No         | In regions.schema.json#/definitions/region | -                                                                                    |
|                                                                                                |         |                  |            |                                            |                                                                                      |

<details>
<summary><strong> <a name="items_subnetworks_items_allOf_i0_then_name"></a>1.7.1.1.1.1. [Optional] Property Networks > items > subnetworks > Subnetwork > allOf > Private > then > name</strong>  

</summary>
<blockquote>

**Title:** Subnetwork Name

| Type                      | `string`                                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Description:** If this field is not provided ip_cidr_range value will be dynamically generated based on the ip_cidr_range. 
WARNING, if this field is not set changing the ip_cidr_range will change the name dynamically generated.

| Restrictions                      |                                                                                                                                                                                                                                                             |
| --------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Must match regular expression** | ```^(?:[a-z](?:[-a-z0-9]{0,61}[a-z0-9])?)$``` [Test](https://regex101.com/?regex=%5E%28%3F%3A%5Ba-z%5D%28%3F%3A%5B-a-z0-9%5D%7B0%2C61%7D%5Ba-z0-9%5D%29%3F%29%24&testString=%22%3Cprefix%3E-%3Cenvironment%3E-%3Cnetwork%3E-subnet-%3C192-168-0-0-24%3E%22) |
|                                   |                                                                                                                                                                                                                                                             |

**Example:** 

```json
"<prefix>-<environment>-<network>-subnet-<192-168-0-0-24>"
```

</blockquote>
</details>

<details>
<summary><strong> <a name="items_subnetworks_items_allOf_i0_then_ip_cidr_range"></a>1.7.1.1.1.2. [Required] Property Networks > items > subnetworks > Subnetwork > allOf > Private > then > ip_cidr_range</strong>  

</summary>
<blockquote>

| Type                      | `string`                                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Description:** IP space allocated to this subnetwork in CIDR format.

| Restrictions                      |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| --------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Must match regular expression** | ```^(?:([0-9]\|[1-9][0-9]{0,1}\|1[0-9]{1,2}\|2[0-4][0-9]\|25[0-5])(\.([0-9]\|[1-9][0-9]{0,1}\|1[0-9]{1,2}\|2[0-4][0-9]\|25[0-5])){3}/(([0-9]\|[1-2][0-9]\|3[0-2])))$``` [Test](https://regex101.com/?regex=%5E%28%3F%3A%28%5B0-9%5D%7C%5B1-9%5D%5B0-9%5D%7B0%2C1%7D%7C1%5B0-9%5D%7B1%2C2%7D%7C2%5B0-4%5D%5B0-9%5D%7C25%5B0-5%5D%29%28%5C.%28%5B0-9%5D%7C%5B1-9%5D%5B0-9%5D%7B0%2C1%7D%7C1%5B0-9%5D%7B1%2C2%7D%7C2%5B0-4%5D%5B0-9%5D%7C25%5B0-5%5D%29%29%7B3%7D%2F%28%28%5B0-9%5D%7C%5B1-2%5D%5B0-9%5D%7C3%5B0-2%5D%29%29%29%24&testString=%22192.168.0.0%2F24%22) |
|                                   |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |

**Example:** 

```json
"192.168.0.0/24"
```

</blockquote>
</details>

<details>
<summary><strong> <a name="items_subnetworks_items_allOf_i0_then_purpose"></a>1.7.1.1.1.3. [Optional] Property Networks > items > subnetworks > Subnetwork > allOf > Private > then > purpose</strong>  

</summary>
<blockquote>

| Type                      | `const`                                                                                                             |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

Specific value: `"PRIVATE"`

</blockquote>
</details>

<details>
<summary><strong> <a name="items_subnetworks_items_allOf_i0_then_description"></a>1.7.1.1.1.4. [Optional] Property Networks > items > subnetworks > Subnetwork > allOf > Private > then > description</strong>  

</summary>
<blockquote>

| Type                      | `string`                                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Description:** Description of this subnetwork.

</blockquote>
</details>

<details>
<summary><strong> <a name="items_subnetworks_items_allOf_i0_then_secondary_subnetworks"></a>1.7.1.1.1.5. [Optional] Property Networks > items > subnetworks > Subnetwork > allOf > Private > then > secondary_subnetworks</strong>  

</summary>
<blockquote>

| Type                      | `array of object`                                                                                                   |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

|                      | Array restrictions |
| -------------------- | ------------------ |
| **Min items**        | 0                  |
| **Max items**        | 30                 |
| **Items unicity**    | False              |
| **Additional items** | False              |
| **Tuple validation** | See below          |
|                      |                    |

| Each item of this array must be                                             | Description |
| --------------------------------------------------------------------------- | ----------- |
| [items](#items_subnetworks_items_allOf_i0_then_secondary_subnetworks_items) | -           |
|                                                                             |             |

##### <a name="items_subnetworks_items_allOf_i0_then_secondary_subnetworks_items"></a>1.7.1.1.1.5.1. Networks > items > subnetworks > Subnetwork > allOf > Private > then > secondary_subnetworks > items

| Type                      | `object`                                                                                         |
| ------------------------- | ------------------------------------------------------------------------------------------------ |
| **Additional properties** | [![badge](https://img.shields.io/badge/Not+allowed-red)](# "Additional Properties not allowed.") |
|                           |                                                                                                  |

| Property                                                                                             | Pattern | Type   | Deprecated | Definition | Title/Description          |
| ---------------------------------------------------------------------------------------------------- | ------- | ------ | ---------- | ---------- | -------------------------- |
| - [nat_group_id](#items_subnetworks_items_allOf_i0_then_secondary_subnetworks_items_nat_group_id )   | No      | string | No         | -          | -                          |
| + [ip_cidr_range](#items_subnetworks_items_allOf_i0_then_secondary_subnetworks_items_ip_cidr_range ) | No      | string | No         | -          | Secondary Subnetwork Range |
|                                                                                                      |         |        |            |            |                            |

<details>
<summary><strong> <a name="items_subnetworks_items_allOf_i0_then_secondary_subnetworks_items_nat_group_id"></a>1.7.1.1.1.5.1.1. [Optional] Property Networks > items > subnetworks > Subnetwork > allOf > Private > then > secondary_subnetworks > items > nat_group_id</strong>  

</summary>
<blockquote>

| Type                      | `string`                                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Example:** 

```json
"nat-group"
```

</blockquote>
</details>

<details>
<summary><strong> <a name="items_subnetworks_items_allOf_i0_then_secondary_subnetworks_items_ip_cidr_range"></a>1.7.1.1.1.5.1.2. [Required] Property Networks > items > subnetworks > Subnetwork > allOf > Private > then > secondary_subnetworks > items > ip_cidr_range</strong>  

</summary>
<blockquote>

**Title:** Secondary Subnetwork Range

| Type                      | `string`                                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Description:** IP space allocated to this subnetwork in CIDR format.

| Restrictions                      |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| --------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Must match regular expression** | ```^(?:([0-9]\|[1-9][0-9]{0,1}\|1[0-9]{1,2}\|2[0-4][0-9]\|25[0-5])(\.([0-9]\|[1-9][0-9]{0,1}\|1[0-9]{1,2}\|2[0-4][0-9]\|25[0-5])){3}/(([0-9]\|[1-2][0-9]\|3[0-2])))$``` [Test](https://regex101.com/?regex=%5E%28%3F%3A%28%5B0-9%5D%7C%5B1-9%5D%5B0-9%5D%7B0%2C1%7D%7C1%5B0-9%5D%7B1%2C2%7D%7C2%5B0-4%5D%5B0-9%5D%7C25%5B0-5%5D%29%28%5C.%28%5B0-9%5D%7C%5B1-9%5D%5B0-9%5D%7B0%2C1%7D%7C1%5B0-9%5D%7B1%2C2%7D%7C2%5B0-4%5D%5B0-9%5D%7C25%5B0-5%5D%29%29%7B3%7D%2F%28%28%5B0-9%5D%7C%5B1-2%5D%5B0-9%5D%7C3%5B0-2%5D%29%29%29%24&testString=%22192.168.0.0%2F24%22) |
|                                   |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |

**Example:** 

```json
"192.168.0.0/24"
```

</blockquote>
</details>

</blockquote>
</details>

<details>
<summary><strong> <a name="items_subnetworks_items_allOf_i0_then_private_ip_google_access"></a>1.7.1.1.1.6. [Optional] Property Networks > items > subnetworks > Subnetwork > allOf > Private > then > private_ip_google_access</strong>  

</summary>
<blockquote>

| Type                      | `enum (of string)`                                                                                                  |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `"ENABLED"`                                                                                                         |
|                           |                                                                                                                     |

**Description:** (OPTIONAL) Provide access to Google Cloud APIs from this subnet for instances without a public ip address.

Must be one of:
* "ENABLED"
* "DISABLED"

**Example:** 

```json
"ENABLED"
```

</blockquote>
</details>

<details>
<summary><strong> <a name="items_subnetworks_items_allOf_i0_then_log_config"></a>1.7.1.1.1.7. [Optional] Property Networks > items > subnetworks > Subnetwork > allOf > Private > then > log_config</strong>  

</summary>
<blockquote>

| Type                      | `object`                                                                                         |
| ------------------------- | ------------------------------------------------------------------------------------------------ |
| **Additional properties** | [![badge](https://img.shields.io/badge/Not+allowed-red)](# "Additional Properties not allowed.") |
|                           |                                                                                                  |

| Property                                                                                          | Pattern | Type             | Deprecated | Definition | Title/Description                                                                    |
| ------------------------------------------------------------------------------------------------- | ------- | ---------------- | ---------- | ---------- | ------------------------------------------------------------------------------------ |
| + [enabled](#items_subnetworks_items_allOf_i0_then_log_config_enabled )                           | No      | boolean          | No         | -          | Enable/disable VPC Flow Logs for this subnet.                                        |
| - [aggregation_interval](#items_subnetworks_items_allOf_i0_then_log_config_aggregation_interval ) | No      | enum (of string) | No         | -          | Toggles the aggregation interval for collecting flow logs. Increasing the interv ... |
| - [flow_sampling](#items_subnetworks_items_allOf_i0_then_log_config_flow_sampling )               | No      | integer          | No         | -          | Set the sampling rate of VPC flow logs within the subnetwork where 100 means all ... |
| - [metadata](#items_subnetworks_items_allOf_i0_then_log_config_metadata )                         | No      | enum (of string) | No         | -          | -                                                                                    |
| - [metadata_fields](#items_subnetworks_items_allOf_i0_then_log_config_metadata_fields )           | No      | array of string  | No         | -          | Metadata Fields                                                                      |
|                                                                                                   |         |                  |            |            |                                                                                      |

**Examples:** 

```json
{
    "enabled": true,
    "aggregation_interval": "INTERVAL_1_MIN"
}
```
```json
{
    "enabled": false,
    "metadata": "CUSTOM_METADATA",
    "metadata_fields": []
}
```

<details>
<summary><strong> <a name="items_subnetworks_items_allOf_i0_then_log_config_enabled"></a>1.7.1.1.1.7.1. [Required] Property Networks > items > subnetworks > Subnetwork > allOf > Private > then > log_config > enabled</strong>  

</summary>
<blockquote>

| Type                      | `boolean`                                                                                                           |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `false`                                                                                                             |
|                           |                                                                                                                     |

**Description:** Enable/disable VPC Flow Logs for this subnet.

</blockquote>
</details>

<details>
<summary><strong> <a name="items_subnetworks_items_allOf_i0_then_log_config_aggregation_interval"></a>1.7.1.1.1.7.2. [Optional] Property Networks > items > subnetworks > Subnetwork > allOf > Private > then > log_config > aggregation_interval</strong>  

</summary>
<blockquote>

| Type                      | `enum (of string)`                                                                                                  |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `"INTERVAL_5_SEC"`                                                                                                  |
|                           |                                                                                                                     |

**Description:** Toggles the aggregation interval for collecting flow logs. Increasing the interval time will reduce the amount of generated flow logs for long lasting connections.

Must be one of:
* "INTERVAL_5_SEC"
* "INTERVAL_30_SEC"
* "INTERVAL_1_MIN"
* "INTERVAL_5_MIN"
* "INTERVAL_10_MIN"
* "INTERVAL_15_MIN"

</blockquote>
</details>

<details>
<summary><strong> <a name="items_subnetworks_items_allOf_i0_then_log_config_flow_sampling"></a>1.7.1.1.1.7.3. [Optional] Property Networks > items > subnetworks > Subnetwork > allOf > Private > then > log_config > flow_sampling</strong>  

</summary>
<blockquote>

| Type                      | `integer`                                                                                                           |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `50`                                                                                                                |
|                           |                                                                                                                     |

**Description:** Set the sampling rate of VPC flow logs within the subnetwork where 100 means all collected logs are reported, 50 means half of all collected logs are reported and 0 means no logs are reported.

| Restrictions |          |
| ------------ | -------- |
| **Minimum**  | &ge; 0   |
| **Maximum**  | &le; 100 |
|              |          |

</blockquote>
</details>

<details>
<summary><strong> <a name="items_subnetworks_items_allOf_i0_then_log_config_metadata"></a>1.7.1.1.1.7.4. [Optional] Property Networks > items > subnetworks > Subnetwork > allOf > Private > then > log_config > metadata</strong>  

</summary>
<blockquote>

| Type                      | `enum (of string)`                                                                                                  |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `"INCLUDE_ALL_METADATA"`                                                                                            |
|                           |                                                                                                                     |

Must be one of:
* "INCLUDE_ALL_METADATA"
* "EXCLUDE_ALL_METADATA"
* "CUSTOM_METADATA"

</blockquote>
</details>

<details>
<summary><strong> <a name="items_subnetworks_items_allOf_i0_then_log_config_metadata_fields"></a>1.7.1.1.1.7.5. [Optional] Property Networks > items > subnetworks > Subnetwork > allOf > Private > then > log_config > metadata_fields</strong>  

</summary>
<blockquote>

**Title:** Metadata Fields

| Type                      | `array of string`                                                                                                   |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `[]`                                                                                                                |
|                           |                                                                                                                     |

**Description:** List of supported fields can be found at https://cloud.google.com/vpc/docs/flow-logs#record_format

|                      | Array restrictions |
| -------------------- | ------------------ |
| **Min items**        | N/A                |
| **Max items**        | N/A                |
| **Items unicity**    | True               |
| **Additional items** | False              |
| **Tuple validation** | See below          |
|                      |                    |

| Each item of this array must be                                                           | Description |
| ----------------------------------------------------------------------------------------- | ----------- |
| [Metadata Field](#items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items) | -           |
|                                                                                           |             |

##### <a name="items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items"></a>1.7.1.1.1.7.5.1. Networks > items > subnetworks > Subnetwork > allOf > Private > then > log_config > metadata_fields > Metadata Field

**Title:** Metadata Field

| Type                      | `combining`                                                                                                         |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

<blockquote>

| Any of(Option)                                                                                                       |
| -------------------------------------------------------------------------------------------------------------------- |
| [IP Connection](#items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i0)                    |
| [start_time](#items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i1)                       |
| [end_time](#items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i2)                         |
| [bytes_sent](#items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i3)                       |
| [packets_sent](#items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i4)                     |
| [rtt_msec](#items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i5)                         |
| [reporter](#items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i6)                         |
| [Source Instance](#items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i7)                  |
| [Destination Instance](#items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i8)             |
| [Source VPC](#items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i9)                       |
| [Destination VPC](#items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i10)                 |
| [Source Geographic Location](#items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i11)      |
| [Destination Geographic Location](#items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i12) |
| [src_gke_details](#items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i13)                 |
| [dest_gke_details](#items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i14)                |
|                                                                                                                      |

<blockquote>

##### <a name="items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i0"></a>1.7.1.1.1.7.5.1.1. Property `Networks > items > subnetworks > Subnetwork > allOf > Private > then > log_config > metadata_fields > Metadata Field > anyOf > IP Connection`

**Title:** IP Connection

| Type                      | `combining`                                                                                                         |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

<blockquote>

| Any of(Option)                                                                                                    |
| ----------------------------------------------------------------------------------------------------------------- |
| [connection](#items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i0_anyOf_i0)           |
| [connection.src_ip](#items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i0_anyOf_i1)    |
| [connection.src_port](#items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i0_anyOf_i2)  |
| [connection.dest_ip](#items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i0_anyOf_i3)   |
| [connection.dest_port](#items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i0_anyOf_i4) |
| [connection.protocol](#items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i0_anyOf_i5)  |
|                                                                                                                   |

<blockquote>

##### <a name="items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i0_anyOf_i0"></a>1.7.1.1.1.7.5.1.1.1. Property `Networks > items > subnetworks > Subnetwork > allOf > Private > then > log_config > metadata_fields > Metadata Field > anyOf > IP Connection > anyOf > connection`

**Title:** connection

| Type                      | `const`                                                                                                             |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Description:** 5-Tuple describing this connection.

Specific value: `"connection"`

</blockquote>
<blockquote>

##### <a name="items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i0_anyOf_i1"></a>1.7.1.1.1.7.5.1.1.2. Property `Networks > items > subnetworks > Subnetwork > allOf > Private > then > log_config > metadata_fields > Metadata Field > anyOf > IP Connection > anyOf > connection.src_ip`

**Title:** connection.src_ip

| Type                      | `const`                                                                                                             |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Description:** Connection Source IP address

Specific value: `"connection.src_ip"`

</blockquote>
<blockquote>

##### <a name="items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i0_anyOf_i2"></a>1.7.1.1.1.7.5.1.1.3. Property `Networks > items > subnetworks > Subnetwork > allOf > Private > then > log_config > metadata_fields > Metadata Field > anyOf > IP Connection > anyOf > connection.src_port`

**Title:** connection.src_port

| Type                      | `const`                                                                                                             |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Description:** Connection Source port

Specific value: `"connection.src_port"`

</blockquote>
<blockquote>

##### <a name="items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i0_anyOf_i3"></a>1.7.1.1.1.7.5.1.1.4. Property `Networks > items > subnetworks > Subnetwork > allOf > Private > then > log_config > metadata_fields > Metadata Field > anyOf > IP Connection > anyOf > connection.dest_ip`

**Title:** connection.dest_ip

| Type                      | `const`                                                                                                             |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Description:** Connection Destination IP address

Specific value: `"connection.dest_ip"`

</blockquote>
<blockquote>

##### <a name="items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i0_anyOf_i4"></a>1.7.1.1.1.7.5.1.1.5. Property `Networks > items > subnetworks > Subnetwork > allOf > Private > then > log_config > metadata_fields > Metadata Field > anyOf > IP Connection > anyOf > connection.dest_port`

**Title:** connection.dest_port

| Type                      | `const`                                                                                                             |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Description:** Connection Destination Port

Specific value: `"connection.dest_port"`

</blockquote>
<blockquote>

##### <a name="items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i0_anyOf_i5"></a>1.7.1.1.1.7.5.1.1.6. Property `Networks > items > subnetworks > Subnetwork > allOf > Private > then > log_config > metadata_fields > Metadata Field > anyOf > IP Connection > anyOf > connection.protocol`

**Title:** connection.protocol

| Type                      | `const`                                                                                                             |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Description:** Connection IANA protocol number

Specific value: `"connection.protocol"`

</blockquote>

</blockquote>

</blockquote>
<blockquote>

##### <a name="items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i1"></a>1.7.1.1.1.7.5.1.2. Property `Networks > items > subnetworks > Subnetwork > allOf > Private > then > log_config > metadata_fields > Metadata Field > anyOf > start_time`

**Title:** start_time

| Type                      | `const`                                                                                                             |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Description:** Timestamp (RFC 3339 date string format) of the first observed packet during the aggregated time interval.

Specific value: `"start_time"`

</blockquote>
<blockquote>

##### <a name="items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i2"></a>1.7.1.1.1.7.5.1.3. Property `Networks > items > subnetworks > Subnetwork > allOf > Private > then > log_config > metadata_fields > Metadata Field > anyOf > end_time`

**Title:** end_time

| Type                      | `const`                                                                                                             |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Description:** Timestamp (RFC 3339 date string format) of the last observed packet during the aggregated time interval

Specific value: `"end_time"`

</blockquote>
<blockquote>

##### <a name="items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i3"></a>1.7.1.1.1.7.5.1.4. Property `Networks > items > subnetworks > Subnetwork > allOf > Private > then > log_config > metadata_fields > Metadata Field > anyOf > bytes_sent`

**Title:** bytes_sent

| Type                      | `const`                                                                                                             |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Description:** Amount of bytes sent from the source to the destination

Specific value: `"bytes_sent"`

</blockquote>
<blockquote>

##### <a name="items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i4"></a>1.7.1.1.1.7.5.1.5. Property `Networks > items > subnetworks > Subnetwork > allOf > Private > then > log_config > metadata_fields > Metadata Field > anyOf > packets_sent`

**Title:** packets_sent

| Type                      | `const`                                                                                                             |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Description:** Number of packets sent from the source to the destination

Specific value: `"packets_sent"`

</blockquote>
<blockquote>

##### <a name="items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i5"></a>1.7.1.1.1.7.5.1.6. Property `Networks > items > subnetworks > Subnetwork > allOf > Private > then > log_config > metadata_fields > Metadata Field > anyOf > rtt_msec`

**Title:** rtt_msec

| Type                      | `const`                                                                                                             |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Description:** Latency as measured during the time interval, for TCP flows only. The measured latency is the time elapsed between sending a SEQ and receiving a corresponding ACK. The latency result is the sum of the network RTT and any time consumed by the application

Specific value: `"rtt_msec"`

</blockquote>
<blockquote>

##### <a name="items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i6"></a>1.7.1.1.1.7.5.1.7. Property `Networks > items > subnetworks > Subnetwork > allOf > Private > then > log_config > metadata_fields > Metadata Field > anyOf > reporter`

**Title:** reporter

| Type                      | `const`                                                                                                             |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Description:** The side which reported the flow. Can be either SRC or DEST.

Specific value: `"reporter"`

</blockquote>
<blockquote>

##### <a name="items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i7"></a>1.7.1.1.1.7.5.1.8. Property `Networks > items > subnetworks > Subnetwork > allOf > Private > then > log_config > metadata_fields > Metadata Field > anyOf > Source Instance`

**Title:** Source Instance

| Type                      | `combining`                                                                                                         |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

<blockquote>

| Any of(Option)                                                                                                       |
| -------------------------------------------------------------------------------------------------------------------- |
| [src_instance](#items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i7_anyOf_i0)            |
| [src_instance.project_id](#items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i7_anyOf_i1) |
| [src_instance.vm_name](#items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i7_anyOf_i2)    |
| [src_instance.region](#items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i7_anyOf_i3)     |
| [src_instance.zone](#items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i7_anyOf_i4)       |
|                                                                                                                      |

<blockquote>

##### <a name="items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i7_anyOf_i0"></a>1.7.1.1.1.7.5.1.8.1. Property `Networks > items > subnetworks > Subnetwork > allOf > Private > then > log_config > metadata_fields > Metadata Field > anyOf > Source Instance > anyOf > src_instance`

**Title:** src_instance

| Type                      | `const`                                                                                                             |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Description:** If the source of the connection was a VM located on the same VPC, this field is populated with VM instance details. In a Shared VPC configuration, project_id corresponds to the project that owns the instance, usually the service project.

Specific value: `"src_instance"`

</blockquote>
<blockquote>

##### <a name="items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i7_anyOf_i1"></a>1.7.1.1.1.7.5.1.8.2. Property `Networks > items > subnetworks > Subnetwork > allOf > Private > then > log_config > metadata_fields > Metadata Field > anyOf > Source Instance > anyOf > src_instance.project_id`

**Title:** src_instance.project_id

| Type                      | `const`                                                                                                             |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Description:** ID of the project containing the VM

Specific value: `"src_instance.project_id"`

</blockquote>
<blockquote>

##### <a name="items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i7_anyOf_i2"></a>1.7.1.1.1.7.5.1.8.3. Property `Networks > items > subnetworks > Subnetwork > allOf > Private > then > log_config > metadata_fields > Metadata Field > anyOf > Source Instance > anyOf > src_instance.vm_name`

**Title:** src_instance.vm_name

| Type                      | `const`                                                                                                             |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Description:** Instance name of the VM

Specific value: `"src_instance.vm_name"`

</blockquote>
<blockquote>

##### <a name="items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i7_anyOf_i3"></a>1.7.1.1.1.7.5.1.8.4. Property `Networks > items > subnetworks > Subnetwork > allOf > Private > then > log_config > metadata_fields > Metadata Field > anyOf > Source Instance > anyOf > src_instance.region`

**Title:** src_instance.region

| Type                      | `const`                                                                                                             |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Description:** Region of the VM

Specific value: `"src_instance.region"`

</blockquote>
<blockquote>

##### <a name="items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i7_anyOf_i4"></a>1.7.1.1.1.7.5.1.8.5. Property `Networks > items > subnetworks > Subnetwork > allOf > Private > then > log_config > metadata_fields > Metadata Field > anyOf > Source Instance > anyOf > src_instance.zone`

**Title:** src_instance.zone

| Type                      | `const`                                                                                                             |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Description:** Zone of the VM

Specific value: `"src_instance.zone"`

</blockquote>

</blockquote>

</blockquote>
<blockquote>

##### <a name="items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i8"></a>1.7.1.1.1.7.5.1.9. Property `Networks > items > subnetworks > Subnetwork > allOf > Private > then > log_config > metadata_fields > Metadata Field > anyOf > Destination Instance`

**Title:** Destination Instance

| Type                      | `combining`                                                                                                         |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

<blockquote>

| Any of(Option)                                                                                                        |
| --------------------------------------------------------------------------------------------------------------------- |
| [dest_instance](#items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i8_anyOf_i0)            |
| [dest_instance.project_id](#items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i8_anyOf_i1) |
| [dest_instance.vm_name](#items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i8_anyOf_i2)    |
| [dest_instance.region](#items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i8_anyOf_i3)     |
| [dest_instance.zone](#items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i8_anyOf_i4)       |
|                                                                                                                       |

<blockquote>

##### <a name="items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i8_anyOf_i0"></a>1.7.1.1.1.7.5.1.9.1. Property `Networks > items > subnetworks > Subnetwork > allOf > Private > then > log_config > metadata_fields > Metadata Field > anyOf > Destination Instance > anyOf > dest_instance`

**Title:** dest_instance

| Type                      | `const`                                                                                                             |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Description:** If the destination of the connection was a VM located on the same VPC, this field is populated with VM instance details. In a Shared VPC configuration, project_id corresponds to the project that owns the instance, usually the service project.

Specific value: `"dest_instance"`

</blockquote>
<blockquote>

##### <a name="items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i8_anyOf_i1"></a>1.7.1.1.1.7.5.1.9.2. Property `Networks > items > subnetworks > Subnetwork > allOf > Private > then > log_config > metadata_fields > Metadata Field > anyOf > Destination Instance > anyOf > dest_instance.project_id`

**Title:** dest_instance.project_id

| Type                      | `const`                                                                                                             |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Description:** ID of the project containing the VM

Specific value: `"dest_instance.project_id"`

</blockquote>
<blockquote>

##### <a name="items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i8_anyOf_i2"></a>1.7.1.1.1.7.5.1.9.3. Property `Networks > items > subnetworks > Subnetwork > allOf > Private > then > log_config > metadata_fields > Metadata Field > anyOf > Destination Instance > anyOf > dest_instance.vm_name`

**Title:** dest_instance.vm_name

| Type                      | `const`                                                                                                             |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Description:** Instance name of the VM

Specific value: `"dest_instance.vm_name"`

</blockquote>
<blockquote>

##### <a name="items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i8_anyOf_i3"></a>1.7.1.1.1.7.5.1.9.4. Property `Networks > items > subnetworks > Subnetwork > allOf > Private > then > log_config > metadata_fields > Metadata Field > anyOf > Destination Instance > anyOf > dest_instance.region`

**Title:** dest_instance.region

| Type                      | `const`                                                                                                             |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Description:** Region of the VM

Specific value: `"dest_instance.region"`

</blockquote>
<blockquote>

##### <a name="items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i8_anyOf_i4"></a>1.7.1.1.1.7.5.1.9.5. Property `Networks > items > subnetworks > Subnetwork > allOf > Private > then > log_config > metadata_fields > Metadata Field > anyOf > Destination Instance > anyOf > dest_instance.zone`

**Title:** dest_instance.zone

| Type                      | `const`                                                                                                             |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Description:** Zone of the VM

Specific value: `"dest_instance.zone"`

</blockquote>

</blockquote>

</blockquote>
<blockquote>

##### <a name="items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i9"></a>1.7.1.1.1.7.5.1.10. Property `Networks > items > subnetworks > Subnetwork > allOf > Private > then > log_config > metadata_fields > Metadata Field > anyOf > Source VPC`

**Title:** Source VPC

| Type                      | `combining`                                                                                                         |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

<blockquote>

| Any of(Option)                                                                                                       |
| -------------------------------------------------------------------------------------------------------------------- |
| [src_vpc](#items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i9_anyOf_i0)                 |
| [src_vpc.project_id](#items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i9_anyOf_i1)      |
| [src_vpc.vpc_name](#items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i9_anyOf_i2)        |
| [src_vpc.subnetwork_name](#items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i9_anyOf_i3) |
|                                                                                                                      |

<blockquote>

##### <a name="items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i9_anyOf_i0"></a>1.7.1.1.1.7.5.1.10.1. Property `Networks > items > subnetworks > Subnetwork > allOf > Private > then > log_config > metadata_fields > Metadata Field > anyOf > Source VPC > anyOf > src_vpc`

**Title:** src_vpc

| Type                      | `const`                                                                                                             |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Description:** If the source of the connection was a VM located on the same VPC, this field is populated with VPC network details. In a Shared VPC configuration, project_id corresponds to that of the host project.

Specific value: `"src_vpc"`

</blockquote>
<blockquote>

##### <a name="items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i9_anyOf_i1"></a>1.7.1.1.1.7.5.1.10.2. Property `Networks > items > subnetworks > Subnetwork > allOf > Private > then > log_config > metadata_fields > Metadata Field > anyOf > Source VPC > anyOf > src_vpc.project_id`

**Title:** src_vpc.project_id

| Type                      | `const`                                                                                                             |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Description:** ID of the project containing the VPC

Specific value: `"src_vpc.project_id"`

</blockquote>
<blockquote>

##### <a name="items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i9_anyOf_i2"></a>1.7.1.1.1.7.5.1.10.3. Property `Networks > items > subnetworks > Subnetwork > allOf > Private > then > log_config > metadata_fields > Metadata Field > anyOf > Source VPC > anyOf > src_vpc.vpc_name`

**Title:** src_vpc.vpc_name

| Type                      | `const`                                                                                                             |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Description:** VPC on which the VM is operating

Specific value: `"src_vpc.project_id"`

</blockquote>
<blockquote>

##### <a name="items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i9_anyOf_i3"></a>1.7.1.1.1.7.5.1.10.4. Property `Networks > items > subnetworks > Subnetwork > allOf > Private > then > log_config > metadata_fields > Metadata Field > anyOf > Source VPC > anyOf > src_vpc.subnetwork_name`

**Title:** src_vpc.subnetwork_name

| Type                      | `const`                                                                                                             |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Description:** Subnetwork on which the VM is operating

Specific value: `"src_vpc.subnetwork_name"`

</blockquote>

</blockquote>

</blockquote>
<blockquote>

##### <a name="items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i10"></a>1.7.1.1.1.7.5.1.11. Property `Networks > items > subnetworks > Subnetwork > allOf > Private > then > log_config > metadata_fields > Metadata Field > anyOf > Destination VPC`

**Title:** Destination VPC

| Type                      | `combining`                                                                                                         |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

<blockquote>

| Any of(Option)                                                                                                         |
| ---------------------------------------------------------------------------------------------------------------------- |
| [dest_vpc](#items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i10_anyOf_i0)                 |
| [dest_vpc.project_id](#items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i10_anyOf_i1)      |
| [dest_vpc.vpc_name](#items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i10_anyOf_i2)        |
| [dest_vpc.subnetwork_name](#items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i10_anyOf_i3) |
|                                                                                                                        |

<blockquote>

##### <a name="items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i10_anyOf_i0"></a>1.7.1.1.1.7.5.1.11.1. Property `Networks > items > subnetworks > Subnetwork > allOf > Private > then > log_config > metadata_fields > Metadata Field > anyOf > Destination VPC > anyOf > dest_vpc`

**Title:** dest_vpc

| Type                      | `const`                                                                                                             |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Description:** If the destination of the connection was a VM located on the same VPC, this field is populated with VPC network details. In a Shared VPC configuration, project_id corresponds to that of the host project.

Specific value: `"dest_vpc"`

</blockquote>
<blockquote>

##### <a name="items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i10_anyOf_i1"></a>1.7.1.1.1.7.5.1.11.2. Property `Networks > items > subnetworks > Subnetwork > allOf > Private > then > log_config > metadata_fields > Metadata Field > anyOf > Destination VPC > anyOf > dest_vpc.project_id`

**Title:** dest_vpc.project_id

| Type                      | `const`                                                                                                             |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Description:** ID of the project containing the VPC

Specific value: `"dest_vpc.project_id"`

</blockquote>
<blockquote>

##### <a name="items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i10_anyOf_i2"></a>1.7.1.1.1.7.5.1.11.3. Property `Networks > items > subnetworks > Subnetwork > allOf > Private > then > log_config > metadata_fields > Metadata Field > anyOf > Destination VPC > anyOf > dest_vpc.vpc_name`

**Title:** dest_vpc.vpc_name

| Type                      | `const`                                                                                                             |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Description:** VPC on which the VM is operating

Specific value: `"dest_vpc.project_id"`

</blockquote>
<blockquote>

##### <a name="items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i10_anyOf_i3"></a>1.7.1.1.1.7.5.1.11.4. Property `Networks > items > subnetworks > Subnetwork > allOf > Private > then > log_config > metadata_fields > Metadata Field > anyOf > Destination VPC > anyOf > dest_vpc.subnetwork_name`

**Title:** dest_vpc.subnetwork_name

| Type                      | `const`                                                                                                             |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Description:** Subnetwork on which the VM is operating

Specific value: `"dest_vpc.subnetwork_name"`

</blockquote>

</blockquote>

</blockquote>
<blockquote>

##### <a name="items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i11"></a>1.7.1.1.1.7.5.1.12. Property `Networks > items > subnetworks > Subnetwork > allOf > Private > then > log_config > metadata_fields > Metadata Field > anyOf > Source Geographic Location`

**Title:** Source Geographic Location

| Type                      | `combining`                                                                                                         |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

<blockquote>

| Any of(Option)                                                                                                       |
| -------------------------------------------------------------------------------------------------------------------- |
| [src_location](#items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i11_anyOf_i0)           |
| [src_location.continent](#items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i11_anyOf_i1) |
| [src_location.country](#items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i11_anyOf_i2)   |
| [src_location.region](#items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i11_anyOf_i3)    |
| [src_location.city](#items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i11_anyOf_i4)      |
| [src_location.asn](#items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i11_anyOf_i5)       |
|                                                                                                                      |

<blockquote>

##### <a name="items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i11_anyOf_i0"></a>1.7.1.1.1.7.5.1.12.1. Property `Networks > items > subnetworks > Subnetwork > allOf > Private > then > log_config > metadata_fields > Metadata Field > anyOf > Source Geographic Location > anyOf > src_location`

**Title:** src_location

| Type                      | `const`                                                                                                             |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Description:** If the source of the connection was external to the VPC, this field is populated with available location metadata.

Specific value: `"src_location"`

</blockquote>
<blockquote>

##### <a name="items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i11_anyOf_i1"></a>1.7.1.1.1.7.5.1.12.2. Property `Networks > items > subnetworks > Subnetwork > allOf > Private > then > log_config > metadata_fields > Metadata Field > anyOf > Source Geographic Location > anyOf > src_location.continent`

**Title:** src_location.continent

| Type                      | `const`                                                                                                             |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Description:** Continent for external endpoints

Specific value: `"src_location.continent"`

</blockquote>
<blockquote>

##### <a name="items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i11_anyOf_i2"></a>1.7.1.1.1.7.5.1.12.3. Property `Networks > items > subnetworks > Subnetwork > allOf > Private > then > log_config > metadata_fields > Metadata Field > anyOf > Source Geographic Location > anyOf > src_location.country`

**Title:** src_location.country

| Type                      | `const`                                                                                                             |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Description:** Country for external endpoints, represented as ISO 3166-1 Alpha-3 country codes.

Specific value: `"src_location.country"`

</blockquote>
<blockquote>

##### <a name="items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i11_anyOf_i3"></a>1.7.1.1.1.7.5.1.12.4. Property `Networks > items > subnetworks > Subnetwork > allOf > Private > then > log_config > metadata_fields > Metadata Field > anyOf > Source Geographic Location > anyOf > src_location.region`

**Title:** src_location.region

| Type                      | `const`                                                                                                             |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Description:** Region for external endpoints

Specific value: `"src_location.region"`

</blockquote>
<blockquote>

##### <a name="items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i11_anyOf_i4"></a>1.7.1.1.1.7.5.1.12.5. Property `Networks > items > subnetworks > Subnetwork > allOf > Private > then > log_config > metadata_fields > Metadata Field > anyOf > Source Geographic Location > anyOf > src_location.city`

**Title:** src_location.city

| Type                      | `const`                                                                                                             |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Description:** City for external endpoints

Specific value: `"src_location.city"`

</blockquote>
<blockquote>

##### <a name="items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i11_anyOf_i5"></a>1.7.1.1.1.7.5.1.12.6. Property `Networks > items > subnetworks > Subnetwork > allOf > Private > then > log_config > metadata_fields > Metadata Field > anyOf > Source Geographic Location > anyOf > src_location.asn`

**Title:** src_location.asn

| Type                      | `const`                                                                                                             |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Description:** The autonomous system number (ASN) of the external network to which this endpoint belongs.

Specific value: `"src_location.asn"`

</blockquote>

</blockquote>

</blockquote>
<blockquote>

##### <a name="items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i12"></a>1.7.1.1.1.7.5.1.13. Property `Networks > items > subnetworks > Subnetwork > allOf > Private > then > log_config > metadata_fields > Metadata Field > anyOf > Destination Geographic Location`

**Title:** Destination Geographic Location

| Type                      | `combining`                                                                                                         |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

<blockquote>

| Any of(Option)                                                                                                        |
| --------------------------------------------------------------------------------------------------------------------- |
| [dest_location](#items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i12_anyOf_i0)           |
| [dest_location.continent](#items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i12_anyOf_i1) |
| [dest_location.country](#items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i12_anyOf_i2)   |
| [dest_location.region](#items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i12_anyOf_i3)    |
| [dest_location.city](#items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i12_anyOf_i4)      |
| [dest_location.asn](#items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i12_anyOf_i5)       |
|                                                                                                                       |

<blockquote>

##### <a name="items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i12_anyOf_i0"></a>1.7.1.1.1.7.5.1.13.1. Property `Networks > items > subnetworks > Subnetwork > allOf > Private > then > log_config > metadata_fields > Metadata Field > anyOf > Destination Geographic Location > anyOf > dest_location`

**Title:** dest_location

| Type                      | `const`                                                                                                             |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Description:** If the destination of the connection was external to the VPC, this field is populated with available location metadata.

Specific value: `"dest_location"`

</blockquote>
<blockquote>

##### <a name="items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i12_anyOf_i1"></a>1.7.1.1.1.7.5.1.13.2. Property `Networks > items > subnetworks > Subnetwork > allOf > Private > then > log_config > metadata_fields > Metadata Field > anyOf > Destination Geographic Location > anyOf > dest_location.continent`

**Title:** dest_location.continent

| Type                      | `const`                                                                                                             |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Description:** Continent for external endpoints

Specific value: `"dest_location.continent"`

</blockquote>
<blockquote>

##### <a name="items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i12_anyOf_i2"></a>1.7.1.1.1.7.5.1.13.3. Property `Networks > items > subnetworks > Subnetwork > allOf > Private > then > log_config > metadata_fields > Metadata Field > anyOf > Destination Geographic Location > anyOf > dest_location.country`

**Title:** dest_location.country

| Type                      | `const`                                                                                                             |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Description:** Country for external endpoints, represented as ISO 3166-1 Alpha-3 country codes.

Specific value: `"dest_location.country"`

</blockquote>
<blockquote>

##### <a name="items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i12_anyOf_i3"></a>1.7.1.1.1.7.5.1.13.4. Property `Networks > items > subnetworks > Subnetwork > allOf > Private > then > log_config > metadata_fields > Metadata Field > anyOf > Destination Geographic Location > anyOf > dest_location.region`

**Title:** dest_location.region

| Type                      | `const`                                                                                                             |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Description:** Region for external endpoints

Specific value: `"dest_location.region"`

</blockquote>
<blockquote>

##### <a name="items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i12_anyOf_i4"></a>1.7.1.1.1.7.5.1.13.5. Property `Networks > items > subnetworks > Subnetwork > allOf > Private > then > log_config > metadata_fields > Metadata Field > anyOf > Destination Geographic Location > anyOf > dest_location.city`

**Title:** dest_location.city

| Type                      | `const`                                                                                                             |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Description:** City for external endpoints

Specific value: `"dest_location.city"`

</blockquote>
<blockquote>

##### <a name="items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i12_anyOf_i5"></a>1.7.1.1.1.7.5.1.13.6. Property `Networks > items > subnetworks > Subnetwork > allOf > Private > then > log_config > metadata_fields > Metadata Field > anyOf > Destination Geographic Location > anyOf > dest_location.asn`

**Title:** dest_location.asn

| Type                      | `const`                                                                                                             |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Description:** The autonomous system number (ASN) of the external network to which this endpoint belongs.

Specific value: `"dest_location.asn"`

</blockquote>

</blockquote>

</blockquote>
<blockquote>

##### <a name="items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i13"></a>1.7.1.1.1.7.5.1.14. Property `Networks > items > subnetworks > Subnetwork > allOf > Private > then > log_config > metadata_fields > Metadata Field > anyOf > src_gke_details`

**Title:** src_gke_details

| Type                      | `const`                                                                                                             |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Description:** GKE metadata for source endpoints. Only available if the endpoint is GKE.

Specific value: `"src_gke_details"`

</blockquote>
<blockquote>

##### <a name="items_subnetworks_items_allOf_i0_then_log_config_metadata_fields_items_anyOf_i14"></a>1.7.1.1.1.7.5.1.15. Property `Networks > items > subnetworks > Subnetwork > allOf > Private > then > log_config > metadata_fields > Metadata Field > anyOf > dest_gke_details`

**Title:** dest_gke_details

| Type                      | `const`                                                                                                             |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Description:** GKE metadata for destination endpoints. Only available if the endpoint is GKE.

Specific value: `"dest_gke_details"`

</blockquote>

</blockquote>

</blockquote>
</details>

</blockquote>
</details>

<details>
<summary><strong> <a name="items_subnetworks_items_allOf_i0_then_cloud_nat"></a>1.7.1.1.1.8. [Optional] Property Networks > items > subnetworks > Subnetwork > allOf > Private > then > cloud_nat</strong>  

</summary>
<blockquote>

| Type                      | `object`                                                                                         |
| ------------------------- | ------------------------------------------------------------------------------------------------ |
| **Additional properties** | [![badge](https://img.shields.io/badge/Not+allowed-red)](# "Additional Properties not allowed.") |
|                           |                                                                                                  |

| Property                                                                                     | Pattern | Type             | Deprecated | Definition | Title/Description |
| -------------------------------------------------------------------------------------------- | ------- | ---------------- | ---------- | ---------- | ----------------- |
| + [subnetworks_to_nat](#items_subnetworks_items_allOf_i0_then_cloud_nat_subnetworks_to_nat ) | No      | enum (of string) | No         | -          | -                 |
| + [nat_group_id](#items_subnetworks_items_allOf_i0_then_cloud_nat_nat_group_id )             | No      | string           | No         | -          | -                 |
|                                                                                              |         |                  |            |            |                   |

**Examples:** 

```json
{}
```
```json
{
    "subnetworks_to_nat": "ALL_SUBNETWORKS"
}
```
```json
{
    "subnetworks_to_nat": "SELECTED_SECONDARY_SUBNETWORKS",
    "nat_group_id": "nat-group"
}
```

<details>
<summary><strong> <a name="items_subnetworks_items_allOf_i0_then_cloud_nat_subnetworks_to_nat"></a>1.7.1.1.1.8.1. [Required] Property Networks > items > subnetworks > Subnetwork > allOf > Private > then > cloud_nat > subnetworks_to_nat</strong>  

</summary>
<blockquote>

| Type                      | `enum (of string)`                                                                                                  |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `"DISABLED"`                                                                                                        |
|                           |                                                                                                                     |

Must be one of:
* "DISABLED"
* "ALL_SUBNETWORKS"
* "ALL_SECONDARY_SUBNETWORKS"
* "PRIMARY_SUBNETWORKS"
* "SELECTED_SECONDARY_SUBNETWORKS"
* "PRIMARY_SUBNETWORK_SELECTED_SECONDARY_SUBNETWORKS"

</blockquote>
</details>

<details>
<summary><strong> <a name="items_subnetworks_items_allOf_i0_then_cloud_nat_nat_group_id"></a>1.7.1.1.1.8.2. [Required] Property Networks > items > subnetworks > Subnetwork > allOf > Private > then > cloud_nat > nat_group_id</strong>  

</summary>
<blockquote>

| Type                      | `string`                                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Example:** 

```json
"nat-group"
```

</blockquote>
</details>

</blockquote>
</details>

<details>
<summary><strong> <a name="items_subnetworks_items_allOf_i0_then_region"></a>1.7.1.1.1.9. [Required] Property Networks > items > subnetworks > Subnetwork > allOf > Private > then > region</strong>  

</summary>
<blockquote>

| Type                      | `enum (of string)`                                                                                                  |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Defined in**            | regions.schema.json#/definitions/region                                                                             |
|                           |                                                                                                                     |

Must be one of:
* "ASIA-EAST1"
* "ASIA-EAST2"
* "ASIA-NORTHEAST1"
* "ASIA-NORTHEAST2"
* "ASIA-NORTHEAST3"
* "ASIA-SOUTH1"
* "ASIA-SOUTH2"
* "ASIA-SOUTHEAST1"
* "ASIA-SOUTHEAST2"
* "AUSTRALIA-SOUTHEAST1"
* "AUSTRALIA-SOUTHEAST2"
* "EUROPE-CENTRAL2"
* "EUROPE-NORTH1"
* "EUROPE-WEST1"
* "EUROPE-WEST2"
* "EUROPE-WEST3"
* "EUROPE-WEST4"
* "EUROPE-WEST6"
* "NORTHAMERICA-NORTHEAST1"
* "NORTHAMERICA-NORTHEAST2"
* "SOUTHAMERICA-EAST1"
* "US-CENTRAL1"
* "US-EAST1"
* "US-EAST4"
* "US-WEST1"
* "US-WEST2"
* "US-WEST3"
* "US-WEST4"

**Example:** 

```json
"US-CENTRAL1"
```

</blockquote>
</details>

</blockquote>
<blockquote>

##### <a name="items_subnetworks_items_allOf_i1"></a>1.7.1.2. Property `Networks > items > subnetworks > Subnetwork > allOf > Private Service Connect`

**Title:** Private Service Connect

| Type                      | `object`                                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Description:** A subnetwork with purpose set to PRIVATE_SERVICE_CONNECT is a user-created subnetwork that is reserved for Private Service Connect Internal Load Balancing.

##### <a name="autogenerated_heading_3"></a>1.7.1.2.1. If (purpose = "PRIVATE_SERVICE_CONNECT")

| Type                      | `object`                                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Defined in**            | #/definitions/private_service_connect                                                                               |
|                           |                                                                                                                     |

| Property                                                                 | Pattern | Type             | Deprecated | Definition                                 | Title/Description                                                                    |
| ------------------------------------------------------------------------ | ------- | ---------------- | ---------- | ------------------------------------------ | ------------------------------------------------------------------------------------ |
| + [ip_cidr_range](#items_subnetworks_items_allOf_i1_then_ip_cidr_range ) | No      | string           | No         | -                                          | IP space allocated to this subnetwork in CIDR format.                                |
| - [name](#items_subnetworks_items_allOf_i1_then_name )                   | No      | string or null   | No         | -                                          | if this field is not provided ip_cidr_range value will be dynamically generated  ... |
| - [purpose](#items_subnetworks_items_allOf_i1_then_purpose )             | No      | enum (of string) | No         | -                                          | -                                                                                    |
| - [description](#items_subnetworks_items_allOf_i1_then_description )     | No      | string or null   | No         | -                                          | Description of this subnetwork.                                                      |
| + [region](#items_subnetworks_items_allOf_i1_then_region )               | No      | enum (of string) | No         | In regions.schema.json#/definitions/region | -                                                                                    |
|                                                                          |         |                  |            |                                            |                                                                                      |

<details>
<summary><strong> <a name="items_subnetworks_items_allOf_i1_then_ip_cidr_range"></a>1.7.1.2.1.1. [Required] Property Networks > items > subnetworks > Subnetwork > allOf > Private Service Connect > then > ip_cidr_range</strong>  

</summary>
<blockquote>

| Type                      | `string`                                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Description:** IP space allocated to this subnetwork in CIDR format.

| Restrictions                      |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| --------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Must match regular expression** | ```^(?:([0-9]\|[1-9][0-9]{0,1}\|1[0-9]{1,2}\|2[0-4][0-9]\|25[0-5])(\.([0-9]\|[1-9][0-9]{0,1}\|1[0-9]{1,2}\|2[0-4][0-9]\|25[0-5])){3}/(([0-9]\|[1-2][0-9]\|3[0-2])))$``` [Test](https://regex101.com/?regex=%5E%28%3F%3A%28%5B0-9%5D%7C%5B1-9%5D%5B0-9%5D%7B0%2C1%7D%7C1%5B0-9%5D%7B1%2C2%7D%7C2%5B0-4%5D%5B0-9%5D%7C25%5B0-5%5D%29%28%5C.%28%5B0-9%5D%7C%5B1-9%5D%5B0-9%5D%7B0%2C1%7D%7C1%5B0-9%5D%7B1%2C2%7D%7C2%5B0-4%5D%5B0-9%5D%7C25%5B0-5%5D%29%29%7B3%7D%2F%28%28%5B0-9%5D%7C%5B1-2%5D%5B0-9%5D%7C3%5B0-2%5D%29%29%29%24&testString=%22192.168.0.0%2F24%22) |
|                                   |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |

**Example:** 

```json
"192.168.0.0/24"
```

</blockquote>
</details>

<details>
<summary><strong> <a name="items_subnetworks_items_allOf_i1_then_name"></a>1.7.1.2.1.2. [Optional] Property Networks > items > subnetworks > Subnetwork > allOf > Private Service Connect > then > name</strong>  

</summary>
<blockquote>

| Type                      | `string or null`                                                                                                    |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `null`                                                                                                              |
|                           |                                                                                                                     |

**Description:** if this field is not provided ip_cidr_range value will be dynamically generated based on the ip_cidr_range. WARNING, if this field is not set changing the ip_cidr_range will change the name dynamically generated.

| Restrictions                      |                                                                                                                                                                                                                                                             |
| --------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Must match regular expression** | ```^(?:[a-z](?:[-a-z0-9]{0,61}[a-z0-9])?)$``` [Test](https://regex101.com/?regex=%5E%28%3F%3A%5Ba-z%5D%28%3F%3A%5B-a-z0-9%5D%7B0%2C61%7D%5Ba-z0-9%5D%29%3F%29%24&testString=%22%3Cprefix%3E-%3Cenvironment%3E-%3Cnetwork%3E-subnet-%3C192-168-0-0-24%3E%22) |
|                                   |                                                                                                                                                                                                                                                             |

**Example:** 

```json
"<prefix>-<environment>-<network>-subnet-<192-168-0-0-24>"
```

</blockquote>
</details>

<details>
<summary><strong> <a name="items_subnetworks_items_allOf_i1_then_purpose"></a>1.7.1.2.1.3. [Optional] Property Networks > items > subnetworks > Subnetwork > allOf > Private Service Connect > then > purpose</strong>  

</summary>
<blockquote>

| Type                      | `enum (of string)`                                                                                                  |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `"PRIVATE"`                                                                                                         |
|                           |                                                                                                                     |

Must be one of:
* "PRIVATE"
* "PRIVATE_SERVICE_CONNECT"
* "INTERNAL_HTTPS_LOAD_BALANCER"

</blockquote>
</details>

<details>
<summary><strong> <a name="items_subnetworks_items_allOf_i1_then_description"></a>1.7.1.2.1.4. [Optional] Property Networks > items > subnetworks > Subnetwork > allOf > Private Service Connect > then > description</strong>  

</summary>
<blockquote>

| Type                      | `string or null`                                                                                                    |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `null`                                                                                                              |
|                           |                                                                                                                     |

**Description:** Description of this subnetwork.

</blockquote>
</details>

<details>
<summary><strong> <a name="items_subnetworks_items_allOf_i1_then_region"></a>1.7.1.2.1.5. [Required] Property Networks > items > subnetworks > Subnetwork > allOf > Private Service Connect > then > region</strong>  

</summary>
<blockquote>

| Type                      | `enum (of string)`                                                                                                  |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Defined in**            | regions.schema.json#/definitions/region                                                                             |
|                           |                                                                                                                     |

Must be one of:
* "ASIA-EAST1"
* "ASIA-EAST2"
* "ASIA-NORTHEAST1"
* "ASIA-NORTHEAST2"
* "ASIA-NORTHEAST3"
* "ASIA-SOUTH1"
* "ASIA-SOUTH2"
* "ASIA-SOUTHEAST1"
* "ASIA-SOUTHEAST2"
* "AUSTRALIA-SOUTHEAST1"
* "AUSTRALIA-SOUTHEAST2"
* "EUROPE-CENTRAL2"
* "EUROPE-NORTH1"
* "EUROPE-WEST1"
* "EUROPE-WEST2"
* "EUROPE-WEST3"
* "EUROPE-WEST4"
* "EUROPE-WEST6"
* "NORTHAMERICA-NORTHEAST1"
* "NORTHAMERICA-NORTHEAST2"
* "SOUTHAMERICA-EAST1"
* "US-CENTRAL1"
* "US-EAST1"
* "US-EAST4"
* "US-WEST1"
* "US-WEST2"
* "US-WEST3"
* "US-WEST4"

**Example:** 

```json
"US-CENTRAL1"
```

</blockquote>
</details>

</blockquote>
<blockquote>

##### <a name="items_subnetworks_items_allOf_i2"></a>1.7.1.3. Property `Networks > items > subnetworks > Subnetwork > allOf > Internal HTTP(s) Load Balancer`

**Title:** Internal HTTP(s) Load Balancer

| Type                      | `object`                                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Description:** A subnetwork with purpose set to INTERNAL_HTTPS_LOAD_BALANCER is a user-created subnetwork that is reserved for Internal HTTP(S) Load Balancing.

##### <a name="autogenerated_heading_4"></a>1.7.1.3.1. If (purpose = "INTERNAL_HTTPS_LOAD_BALANCER")

| Type                      | `object`                                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Defined in**            | #/definitions/internal_https_load_balancer                                                                          |
|                           |                                                                                                                     |

| Property                                                                 | Pattern | Type             | Deprecated | Definition                                 | Title/Description                                                                    |
| ------------------------------------------------------------------------ | ------- | ---------------- | ---------- | ------------------------------------------ | ------------------------------------------------------------------------------------ |
| + [ip_cidr_range](#items_subnetworks_items_allOf_i2_then_ip_cidr_range ) | No      | string           | No         | -                                          | IP space allocated to this subnetwork in CIDR format.                                |
| - [name](#items_subnetworks_items_allOf_i2_then_name )                   | No      | string or null   | No         | -                                          | if this field is not provided ip_cidr_range value will be dynamically generated  ... |
| - [purpose](#items_subnetworks_items_allOf_i2_then_purpose )             | No      | enum (of string) | No         | -                                          | -                                                                                    |
| - [description](#items_subnetworks_items_allOf_i2_then_description )     | No      | string or null   | No         | -                                          | Description of this subnetwork.                                                      |
| + [region](#items_subnetworks_items_allOf_i2_then_region )               | No      | enum (of string) | No         | In regions.schema.json#/definitions/region | -                                                                                    |
| - [role](#items_subnetworks_items_allOf_i2_then_role )                   | No      | enum (of string) | No         | -                                          | -                                                                                    |
|                                                                          |         |                  |            |                                            |                                                                                      |

<details>
<summary><strong> <a name="items_subnetworks_items_allOf_i2_then_ip_cidr_range"></a>1.7.1.3.1.1. [Required] Property Networks > items > subnetworks > Subnetwork > allOf > Internal HTTP(s) Load Balancer > then > ip_cidr_range</strong>  

</summary>
<blockquote>

| Type                      | `string`                                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Description:** IP space allocated to this subnetwork in CIDR format.

| Restrictions                      |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| --------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Must match regular expression** | ```^(?:([0-9]\|[1-9][0-9]{0,1}\|1[0-9]{1,2}\|2[0-4][0-9]\|25[0-5])(\.([0-9]\|[1-9][0-9]{0,1}\|1[0-9]{1,2}\|2[0-4][0-9]\|25[0-5])){3}/(([0-9]\|[1-2][0-9]\|3[0-2])))$``` [Test](https://regex101.com/?regex=%5E%28%3F%3A%28%5B0-9%5D%7C%5B1-9%5D%5B0-9%5D%7B0%2C1%7D%7C1%5B0-9%5D%7B1%2C2%7D%7C2%5B0-4%5D%5B0-9%5D%7C25%5B0-5%5D%29%28%5C.%28%5B0-9%5D%7C%5B1-9%5D%5B0-9%5D%7B0%2C1%7D%7C1%5B0-9%5D%7B1%2C2%7D%7C2%5B0-4%5D%5B0-9%5D%7C25%5B0-5%5D%29%29%7B3%7D%2F%28%28%5B0-9%5D%7C%5B1-2%5D%5B0-9%5D%7C3%5B0-2%5D%29%29%29%24&testString=%22192.168.0.0%2F24%22) |
|                                   |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |

**Example:** 

```json
"192.168.0.0/24"
```

</blockquote>
</details>

<details>
<summary><strong> <a name="items_subnetworks_items_allOf_i2_then_name"></a>1.7.1.3.1.2. [Optional] Property Networks > items > subnetworks > Subnetwork > allOf > Internal HTTP(s) Load Balancer > then > name</strong>  

</summary>
<blockquote>

| Type                      | `string or null`                                                                                                    |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `null`                                                                                                              |
|                           |                                                                                                                     |

**Description:** if this field is not provided ip_cidr_range value will be dynamically generated based on the ip_cidr_range. WARNING, if this field is not set changing the ip_cidr_range will change the name dynamically generated.

| Restrictions                      |                                                                                                                                                                                                                                                             |
| --------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Must match regular expression** | ```^(?:[a-z](?:[-a-z0-9]{0,61}[a-z0-9])?)$``` [Test](https://regex101.com/?regex=%5E%28%3F%3A%5Ba-z%5D%28%3F%3A%5B-a-z0-9%5D%7B0%2C61%7D%5Ba-z0-9%5D%29%3F%29%24&testString=%22%3Cprefix%3E-%3Cenvironment%3E-%3Cnetwork%3E-subnet-%3C192-168-0-0-24%3E%22) |
|                                   |                                                                                                                                                                                                                                                             |

**Example:** 

```json
"<prefix>-<environment>-<network>-subnet-<192-168-0-0-24>"
```

</blockquote>
</details>

<details>
<summary><strong> <a name="items_subnetworks_items_allOf_i2_then_purpose"></a>1.7.1.3.1.3. [Optional] Property Networks > items > subnetworks > Subnetwork > allOf > Internal HTTP(s) Load Balancer > then > purpose</strong>  

</summary>
<blockquote>

| Type                      | `enum (of string)`                                                                                                  |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `"PRIVATE"`                                                                                                         |
|                           |                                                                                                                     |

Must be one of:
* "PRIVATE"
* "PRIVATE_SERVICE_CONNECT"
* "INTERNAL_HTTPS_LOAD_BALANCER"

</blockquote>
</details>

<details>
<summary><strong> <a name="items_subnetworks_items_allOf_i2_then_description"></a>1.7.1.3.1.4. [Optional] Property Networks > items > subnetworks > Subnetwork > allOf > Internal HTTP(s) Load Balancer > then > description</strong>  

</summary>
<blockquote>

| Type                      | `string or null`                                                                                                    |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `null`                                                                                                              |
|                           |                                                                                                                     |

**Description:** Description of this subnetwork.

</blockquote>
</details>

<details>
<summary><strong> <a name="items_subnetworks_items_allOf_i2_then_region"></a>1.7.1.3.1.5. [Required] Property Networks > items > subnetworks > Subnetwork > allOf > Internal HTTP(s) Load Balancer > then > region</strong>  

</summary>
<blockquote>

| Type                      | `enum (of string)`                                                                                                  |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Defined in**            | regions.schema.json#/definitions/region                                                                             |
|                           |                                                                                                                     |

Must be one of:
* "ASIA-EAST1"
* "ASIA-EAST2"
* "ASIA-NORTHEAST1"
* "ASIA-NORTHEAST2"
* "ASIA-NORTHEAST3"
* "ASIA-SOUTH1"
* "ASIA-SOUTH2"
* "ASIA-SOUTHEAST1"
* "ASIA-SOUTHEAST2"
* "AUSTRALIA-SOUTHEAST1"
* "AUSTRALIA-SOUTHEAST2"
* "EUROPE-CENTRAL2"
* "EUROPE-NORTH1"
* "EUROPE-WEST1"
* "EUROPE-WEST2"
* "EUROPE-WEST3"
* "EUROPE-WEST4"
* "EUROPE-WEST6"
* "NORTHAMERICA-NORTHEAST1"
* "NORTHAMERICA-NORTHEAST2"
* "SOUTHAMERICA-EAST1"
* "US-CENTRAL1"
* "US-EAST1"
* "US-EAST4"
* "US-WEST1"
* "US-WEST2"
* "US-WEST3"
* "US-WEST4"

**Example:** 

```json
"US-CENTRAL1"
```

</blockquote>
</details>

<details>
<summary><strong> <a name="items_subnetworks_items_allOf_i2_then_role"></a>1.7.1.3.1.6. [Optional] Property Networks > items > subnetworks > Subnetwork > allOf > Internal HTTP(s) Load Balancer > then > role</strong>  

</summary>
<blockquote>

| Type                      | `enum (of string)`                                                                                                  |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `"ACTIVE"`                                                                                                          |
|                           |                                                                                                                     |

Must be one of:
* "BACKUP"
* "ACTIVE"

</blockquote>
</details>

</blockquote>

</blockquote>

</blockquote>
</details>

<details>
<summary><strong> <a name="items_cloud_nat"></a>1.8. [Optional] Property Networks > items > cloud_nat</strong>  

</summary>
<blockquote>

| Type                      | `object`                                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Defined in**            | cloud_nat.schema.json#/definitions/cloud_nat                                                                        |
|                           |                                                                                                                     |

<blockquote>

| All of(Requirement)                                                                                     |
| ------------------------------------------------------------------------------------------------------- |
| [All Primary and Secondary Subnetworks](#items_cloud_nat_allOf_i0)                                      |
| [All Primary Subnetworks](#items_cloud_nat_allOf_i1)                                                    |
| [Selected Primary Subnetworks and Selected Secondary Subnetworks](#items_cloud_nat_allOf_i2)            |
| [[DISABLED] All Primary and Secondary Sub](#items_cloud_nat_allOf_i3)                                   |
| [[DISABLED] Selected Primary Subnetworks and Selected Secondary Subnetworks](#items_cloud_nat_allOf_i4) |
|                                                                                                         |

<blockquote>

#### <a name="items_cloud_nat_allOf_i0"></a>1.8.1. Property `Networks > items > cloud_nat > allOf > All Primary and Secondary Subnetworks`

**Title:** All Primary and Secondary Subnetworks

| Type                      | `object`                                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Description:** Automatically nat all egress traffic from all primary and secondary subnetworks in this network

##### <a name="autogenerated_heading_5"></a>1.8.1.1. If (subnetworks_to_nat = "ALL_PRIMARY_SUBNETWORKS_ALL_SECONDARY_SUBNETWORKS")

| Type                      | `object`                                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Defined in**            | #/definitions/generic                                                                                               |
|                           |                                                                                                                     |

| Property                                                                                       | Pattern | Type             | Deprecated | Definition | Title/Description                                                 |
| ---------------------------------------------------------------------------------------------- | ------- | ---------------- | ---------- | ---------- | ----------------------------------------------------------------- |
| - [subnetworks_to_nat](#items_cloud_nat_allOf_i0_then_subnetworks_to_nat )                     | No      | enum (of string) | No         | -          | -                                                                 |
| - [log_config](#items_cloud_nat_allOf_i0_then_log_config )                                     | No      | enum (of string) | No         | -          | Enable logging for the NAT. Logs will be exported to Stackdriver. |
| - [min_ports_per_vm](#items_cloud_nat_allOf_i0_then_min_ports_per_vm )                         | No      | integer          | No         | -          | Minimum number of ports allocated to a VM from this NAT.          |
| - [udp_idle_timeout](#items_cloud_nat_allOf_i0_then_udp_idle_timeout )                         | No      | integer          | No         | -          | Timeout in seconds for UDP connections.                           |
| - [icmp_idle_timeout](#items_cloud_nat_allOf_i0_then_icmp_idle_timeout )                       | No      | integer          | No         | -          | Timeout in seconds for ICMP connections.                          |
| - [tcp_established_idle_timeout](#items_cloud_nat_allOf_i0_then_tcp_established_idle_timeout ) | No      | integer          | No         | -          | Timeout in seconds for TCP established connections.               |
| - [tcp_transitory_idle_timeout](#items_cloud_nat_allOf_i0_then_tcp_transitory_idle_timeout )   | No      | integer          | No         | -          | Timeout in seconds for TCP transitory connections.                |
|                                                                                                |         |                  |            |            |                                                                   |

<details>
<summary><strong> <a name="items_cloud_nat_allOf_i0_then_subnetworks_to_nat"></a>1.8.1.1.1. [Optional] Property Networks > items > cloud_nat > allOf > All Primary and Secondary Subnetworks > then > subnetworks_to_nat</strong>  

</summary>
<blockquote>

| Type                      | `enum (of string)`                                                                                                  |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `"DISABLED"`                                                                                                        |
|                           |                                                                                                                     |

Must be one of:
* "ALL_PRIMARY_SUBNETWORKS_ALL_SECONDARY_SUBNETWORKS"
* "ALL_PRIMARY_SUBNETWORKS"
* "DISABLED"

</blockquote>
</details>

<details>
<summary><strong> <a name="items_cloud_nat_allOf_i0_then_log_config"></a>1.8.1.1.2. [Optional] Property Networks > items > cloud_nat > allOf > All Primary and Secondary Subnetworks > then > log_config</strong>  

</summary>
<blockquote>

| Type                      | `enum (of string)`                                                                                                  |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `"DISABLED"`                                                                                                        |
|                           |                                                                                                                     |

**Description:** Enable logging for the NAT. Logs will be exported to Stackdriver.

Must be one of:
* "ALL"
* "ERRORS_ONLY"
* "TRANSLATIONS_ONLY"
* "DISABLED"

</blockquote>
</details>

<details>
<summary><strong> <a name="items_cloud_nat_allOf_i0_then_min_ports_per_vm"></a>1.8.1.1.3. [Optional] Property Networks > items > cloud_nat > allOf > All Primary and Secondary Subnetworks > then > min_ports_per_vm</strong>  

</summary>
<blockquote>

| Type                      | `integer`                                                                                                           |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `64`                                                                                                                |
|                           |                                                                                                                     |

**Description:** Minimum number of ports allocated to a VM from this NAT.

</blockquote>
</details>

<details>
<summary><strong> <a name="items_cloud_nat_allOf_i0_then_udp_idle_timeout"></a>1.8.1.1.4. [Optional] Property Networks > items > cloud_nat > allOf > All Primary and Secondary Subnetworks > then > udp_idle_timeout</strong>  

</summary>
<blockquote>

| Type                      | `integer`                                                                                                           |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `30`                                                                                                                |
|                           |                                                                                                                     |

**Description:** Timeout in seconds for UDP connections.

</blockquote>
</details>

<details>
<summary><strong> <a name="items_cloud_nat_allOf_i0_then_icmp_idle_timeout"></a>1.8.1.1.5. [Optional] Property Networks > items > cloud_nat > allOf > All Primary and Secondary Subnetworks > then > icmp_idle_timeout</strong>  

</summary>
<blockquote>

| Type                      | `integer`                                                                                                           |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `30`                                                                                                                |
|                           |                                                                                                                     |

**Description:** Timeout in seconds for ICMP connections.

</blockquote>
</details>

<details>
<summary><strong> <a name="items_cloud_nat_allOf_i0_then_tcp_established_idle_timeout"></a>1.8.1.1.6. [Optional] Property Networks > items > cloud_nat > allOf > All Primary and Secondary Subnetworks > then > tcp_established_idle_timeout</strong>  

</summary>
<blockquote>

| Type                      | `integer`                                                                                                           |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `120`                                                                                                               |
|                           |                                                                                                                     |

**Description:** Timeout in seconds for TCP established connections.

</blockquote>
</details>

<details>
<summary><strong> <a name="items_cloud_nat_allOf_i0_then_tcp_transitory_idle_timeout"></a>1.8.1.1.7. [Optional] Property Networks > items > cloud_nat > allOf > All Primary and Secondary Subnetworks > then > tcp_transitory_idle_timeout</strong>  

</summary>
<blockquote>

| Type                      | `integer`                                                                                                           |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `30`                                                                                                                |
|                           |                                                                                                                     |

**Description:** Timeout in seconds for TCP transitory connections.

</blockquote>
</details>

</blockquote>
<blockquote>

#### <a name="items_cloud_nat_allOf_i1"></a>1.8.2. Property `Networks > items > cloud_nat > allOf > All Primary Subnetworks`

**Title:** All Primary Subnetworks

| Type                      | `object`                                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Description:** Automatically nat all egress traffic from all primary subnetworks in this network

##### <a name="autogenerated_heading_6"></a>1.8.2.1. If (subnetworks_to_nat = "ALL_PRIMARY_SUBNETWORKS")

| Type                      | `object`                                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Defined in**            | #/definitions/generic                                                                                               |
|                           |                                                                                                                     |

| Property                                                                                       | Pattern | Type             | Deprecated | Definition | Title/Description                                                 |
| ---------------------------------------------------------------------------------------------- | ------- | ---------------- | ---------- | ---------- | ----------------------------------------------------------------- |
| - [subnetworks_to_nat](#items_cloud_nat_allOf_i0_then_subnetworks_to_nat )                     | No      | enum (of string) | No         | -          | -                                                                 |
| - [log_config](#items_cloud_nat_allOf_i0_then_log_config )                                     | No      | enum (of string) | No         | -          | Enable logging for the NAT. Logs will be exported to Stackdriver. |
| - [min_ports_per_vm](#items_cloud_nat_allOf_i0_then_min_ports_per_vm )                         | No      | integer          | No         | -          | Minimum number of ports allocated to a VM from this NAT.          |
| - [udp_idle_timeout](#items_cloud_nat_allOf_i0_then_udp_idle_timeout )                         | No      | integer          | No         | -          | Timeout in seconds for UDP connections.                           |
| - [icmp_idle_timeout](#items_cloud_nat_allOf_i0_then_icmp_idle_timeout )                       | No      | integer          | No         | -          | Timeout in seconds for ICMP connections.                          |
| - [tcp_established_idle_timeout](#items_cloud_nat_allOf_i0_then_tcp_established_idle_timeout ) | No      | integer          | No         | -          | Timeout in seconds for TCP established connections.               |
| - [tcp_transitory_idle_timeout](#items_cloud_nat_allOf_i0_then_tcp_transitory_idle_timeout )   | No      | integer          | No         | -          | Timeout in seconds for TCP transitory connections.                |
|                                                                                                |         |                  |            |            |                                                                   |

<details>
<summary><strong> <a name="items_cloud_nat_allOf_i0_then_subnetworks_to_nat"></a>1.8.2.1.1. [Optional] Property Networks > items > cloud_nat > allOf > All Primary and Secondary Subnetworks > then > subnetworks_to_nat</strong>  

</summary>
<blockquote>

| Type                      | `enum (of string)`                                                                                                  |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `"DISABLED"`                                                                                                        |
|                           |                                                                                                                     |

Must be one of:
* "ALL_PRIMARY_SUBNETWORKS_ALL_SECONDARY_SUBNETWORKS"
* "ALL_PRIMARY_SUBNETWORKS"
* "DISABLED"

</blockquote>
</details>

<details>
<summary><strong> <a name="items_cloud_nat_allOf_i0_then_log_config"></a>1.8.2.1.2. [Optional] Property Networks > items > cloud_nat > allOf > All Primary and Secondary Subnetworks > then > log_config</strong>  

</summary>
<blockquote>

| Type                      | `enum (of string)`                                                                                                  |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `"DISABLED"`                                                                                                        |
|                           |                                                                                                                     |

**Description:** Enable logging for the NAT. Logs will be exported to Stackdriver.

Must be one of:
* "ALL"
* "ERRORS_ONLY"
* "TRANSLATIONS_ONLY"
* "DISABLED"

</blockquote>
</details>

<details>
<summary><strong> <a name="items_cloud_nat_allOf_i0_then_min_ports_per_vm"></a>1.8.2.1.3. [Optional] Property Networks > items > cloud_nat > allOf > All Primary and Secondary Subnetworks > then > min_ports_per_vm</strong>  

</summary>
<blockquote>

| Type                      | `integer`                                                                                                           |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `64`                                                                                                                |
|                           |                                                                                                                     |

**Description:** Minimum number of ports allocated to a VM from this NAT.

</blockquote>
</details>

<details>
<summary><strong> <a name="items_cloud_nat_allOf_i0_then_udp_idle_timeout"></a>1.8.2.1.4. [Optional] Property Networks > items > cloud_nat > allOf > All Primary and Secondary Subnetworks > then > udp_idle_timeout</strong>  

</summary>
<blockquote>

| Type                      | `integer`                                                                                                           |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `30`                                                                                                                |
|                           |                                                                                                                     |

**Description:** Timeout in seconds for UDP connections.

</blockquote>
</details>

<details>
<summary><strong> <a name="items_cloud_nat_allOf_i0_then_icmp_idle_timeout"></a>1.8.2.1.5. [Optional] Property Networks > items > cloud_nat > allOf > All Primary and Secondary Subnetworks > then > icmp_idle_timeout</strong>  

</summary>
<blockquote>

| Type                      | `integer`                                                                                                           |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `30`                                                                                                                |
|                           |                                                                                                                     |

**Description:** Timeout in seconds for ICMP connections.

</blockquote>
</details>

<details>
<summary><strong> <a name="items_cloud_nat_allOf_i0_then_tcp_established_idle_timeout"></a>1.8.2.1.6. [Optional] Property Networks > items > cloud_nat > allOf > All Primary and Secondary Subnetworks > then > tcp_established_idle_timeout</strong>  

</summary>
<blockquote>

| Type                      | `integer`                                                                                                           |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `120`                                                                                                               |
|                           |                                                                                                                     |

**Description:** Timeout in seconds for TCP established connections.

</blockquote>
</details>

<details>
<summary><strong> <a name="items_cloud_nat_allOf_i0_then_tcp_transitory_idle_timeout"></a>1.8.2.1.7. [Optional] Property Networks > items > cloud_nat > allOf > All Primary and Secondary Subnetworks > then > tcp_transitory_idle_timeout</strong>  

</summary>
<blockquote>

| Type                      | `integer`                                                                                                           |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `30`                                                                                                                |
|                           |                                                                                                                     |

**Description:** Timeout in seconds for TCP transitory connections.

</blockquote>
</details>

</blockquote>
<blockquote>

#### <a name="items_cloud_nat_allOf_i2"></a>1.8.3. Property `Networks > items > cloud_nat > allOf > Selected Primary Subnetworks and Selected Secondary Subnetworks`

**Title:** Selected Primary Subnetworks and Selected Secondary Subnetworks

| Type                      | `object`                                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Description:** Allows you to select specific primary and secondary subnetworks to nat based on nat_group_id

##### <a name="autogenerated_heading_7"></a>1.8.3.1. If (subnetworks_to_nat = "SELECTED_PRIMARY_SUBNETWORKS_SELECTED_SECONDARY_SUBNETWORKS")

| Type                      | `object`                                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Defined in**            | #/definitions/selected                                                                                              |
|                           |                                                                                                                     |

| Property                                                                   | Pattern | Type             | Deprecated | Definition | Title/Description |
| -------------------------------------------------------------------------- | ------- | ---------------- | ---------- | ---------- | ----------------- |
| - [subnetworks_to_nat](#items_cloud_nat_allOf_i2_then_subnetworks_to_nat ) | No      | enum (of string) | No         | -          | -                 |
| - [nat_groups](#items_cloud_nat_allOf_i2_then_nat_groups )                 | No      | array of object  | No         | -          | -                 |
|                                                                            |         |                  |            |            |                   |

<details>
<summary><strong> <a name="items_cloud_nat_allOf_i2_then_subnetworks_to_nat"></a>1.8.3.1.1. [Optional] Property Networks > items > cloud_nat > allOf > Selected Primary Subnetworks and Selected Secondary Subnetworks > then > subnetworks_to_nat</strong>  

</summary>
<blockquote>

| Type                      | `enum (of string)`                                                                                                  |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `"DISABLED"`                                                                                                        |
|                           |                                                                                                                     |

Must be one of:
* "SELECTED_PRIMARY_SUBNETWORKS_SELECTED_SECONDARY_SUBNETWORKS"
* "DISABLED"

</blockquote>
</details>

<details>
<summary><strong> <a name="items_cloud_nat_allOf_i2_then_nat_groups"></a>1.8.3.1.2. [Optional] Property Networks > items > cloud_nat > allOf > Selected Primary Subnetworks and Selected Secondary Subnetworks > then > nat_groups</strong>  

</summary>
<blockquote>

| Type                      | `array of object`                                                                                                   |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

|                      | Array restrictions |
| -------------------- | ------------------ |
| **Min items**        | 0                  |
| **Max items**        | N/A                |
| **Items unicity**    | True               |
| **Additional items** | False              |
| **Tuple validation** | See below          |
|                      |                    |

| Each item of this array must be                          | Description |
| -------------------------------------------------------- | ----------- |
| [items](#items_cloud_nat_allOf_i2_then_nat_groups_items) | -           |
|                                                          |             |

##### <a name="items_cloud_nat_allOf_i2_then_nat_groups_items"></a>1.8.3.1.2.1. Networks > items > cloud_nat > allOf > Selected Primary Subnetworks and Selected Secondary Subnetworks > then > nat_groups > items

| Type                      | `object`                                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

| Property                                                                                                        | Pattern | Type             | Deprecated | Definition | Title/Description                                                 |
| --------------------------------------------------------------------------------------------------------------- | ------- | ---------------- | ---------- | ---------- | ----------------------------------------------------------------- |
| + [nat_group_id](#items_cloud_nat_allOf_i2_then_nat_groups_items_nat_group_id )                                 | No      | string           | No         | -          | -                                                                 |
| - [log_config](#items_cloud_nat_allOf_i2_then_nat_groups_items_log_config )                                     | No      | enum (of string) | No         | -          | Enable logging for the NAT. Logs will be exported to Stackdriver. |
| - [min_ports_per_vm](#items_cloud_nat_allOf_i2_then_nat_groups_items_min_ports_per_vm )                         | No      | integer          | No         | -          | Minimum number of ports allocated to a VM from this NAT.          |
| - [udp_idle_timeout](#items_cloud_nat_allOf_i2_then_nat_groups_items_udp_idle_timeout )                         | No      | integer          | No         | -          | Timeout in seconds for UDP connections.                           |
| - [icmp_idle_timeout](#items_cloud_nat_allOf_i2_then_nat_groups_items_icmp_idle_timeout )                       | No      | integer          | No         | -          | Timeout in seconds for ICMP connections.                          |
| - [tcp_established_idle_timeout](#items_cloud_nat_allOf_i2_then_nat_groups_items_tcp_established_idle_timeout ) | No      | integer          | No         | -          | Timeout in seconds for TCP established connections.               |
| - [tcp_transitory_idle_timeout](#items_cloud_nat_allOf_i2_then_nat_groups_items_tcp_transitory_idle_timeout )   | No      | integer          | No         | -          | Timeout in seconds for TCP transitory connections.                |
|                                                                                                                 |         |                  |            |            |                                                                   |

<details>
<summary><strong> <a name="items_cloud_nat_allOf_i2_then_nat_groups_items_nat_group_id"></a>1.8.3.1.2.1.1. [Required] Property Networks > items > cloud_nat > allOf > Selected Primary Subnetworks and Selected Secondary Subnetworks > then > nat_groups > items > nat_group_id</strong>  

</summary>
<blockquote>

| Type                      | `string`                                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

</blockquote>
</details>

<details>
<summary><strong> <a name="items_cloud_nat_allOf_i2_then_nat_groups_items_log_config"></a>1.8.3.1.2.1.2. [Optional] Property Networks > items > cloud_nat > allOf > Selected Primary Subnetworks and Selected Secondary Subnetworks > then > nat_groups > items > log_config</strong>  

</summary>
<blockquote>

| Type                      | `enum (of string)`                                                                                                  |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `"DISABLED"`                                                                                                        |
|                           |                                                                                                                     |

**Description:** Enable logging for the NAT. Logs will be exported to Stackdriver.

Must be one of:
* "ALL"
* "ERRORS_ONLY"
* "TRANSLATIONS_ONLY"
* "DISABLED"

</blockquote>
</details>

<details>
<summary><strong> <a name="items_cloud_nat_allOf_i2_then_nat_groups_items_min_ports_per_vm"></a>1.8.3.1.2.1.3. [Optional] Property Networks > items > cloud_nat > allOf > Selected Primary Subnetworks and Selected Secondary Subnetworks > then > nat_groups > items > min_ports_per_vm</strong>  

</summary>
<blockquote>

| Type                      | `integer`                                                                                                           |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `64`                                                                                                                |
|                           |                                                                                                                     |

**Description:** Minimum number of ports allocated to a VM from this NAT.

</blockquote>
</details>

<details>
<summary><strong> <a name="items_cloud_nat_allOf_i2_then_nat_groups_items_udp_idle_timeout"></a>1.8.3.1.2.1.4. [Optional] Property Networks > items > cloud_nat > allOf > Selected Primary Subnetworks and Selected Secondary Subnetworks > then > nat_groups > items > udp_idle_timeout</strong>  

</summary>
<blockquote>

| Type                      | `integer`                                                                                                           |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `30`                                                                                                                |
|                           |                                                                                                                     |

**Description:** Timeout in seconds for UDP connections.

</blockquote>
</details>

<details>
<summary><strong> <a name="items_cloud_nat_allOf_i2_then_nat_groups_items_icmp_idle_timeout"></a>1.8.3.1.2.1.5. [Optional] Property Networks > items > cloud_nat > allOf > Selected Primary Subnetworks and Selected Secondary Subnetworks > then > nat_groups > items > icmp_idle_timeout</strong>  

</summary>
<blockquote>

| Type                      | `integer`                                                                                                           |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `30`                                                                                                                |
|                           |                                                                                                                     |

**Description:** Timeout in seconds for ICMP connections.

</blockquote>
</details>

<details>
<summary><strong> <a name="items_cloud_nat_allOf_i2_then_nat_groups_items_tcp_established_idle_timeout"></a>1.8.3.1.2.1.6. [Optional] Property Networks > items > cloud_nat > allOf > Selected Primary Subnetworks and Selected Secondary Subnetworks > then > nat_groups > items > tcp_established_idle_timeout</strong>  

</summary>
<blockquote>

| Type                      | `integer`                                                                                                           |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `120`                                                                                                               |
|                           |                                                                                                                     |

**Description:** Timeout in seconds for TCP established connections.

</blockquote>
</details>

<details>
<summary><strong> <a name="items_cloud_nat_allOf_i2_then_nat_groups_items_tcp_transitory_idle_timeout"></a>1.8.3.1.2.1.7. [Optional] Property Networks > items > cloud_nat > allOf > Selected Primary Subnetworks and Selected Secondary Subnetworks > then > nat_groups > items > tcp_transitory_idle_timeout</strong>  

</summary>
<blockquote>

| Type                      | `integer`                                                                                                           |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `30`                                                                                                                |
|                           |                                                                                                                     |

**Description:** Timeout in seconds for TCP transitory connections.

</blockquote>
</details>

</blockquote>
</details>

</blockquote>
<blockquote>

#### <a name="items_cloud_nat_allOf_i3"></a>1.8.4. Property `Networks > items > cloud_nat > allOf > [DISABLED] All Primary and Secondary Sub`

**Title:** [DISABLED] All Primary and Secondary Sub

| Type                      | `object`                                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Description:** Disabled placeholder for GENERIC cloud nat, when DISABLED nothing is configured within GCP

##### <a name="autogenerated_heading_8"></a>1.8.4.1. If (subnetworks_to_nat = "DISABLED")

| Type                      | `object`                                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Defined in**            | #/definitions/generic                                                                                               |
|                           |                                                                                                                     |

| Property                                                                                       | Pattern | Type             | Deprecated | Definition | Title/Description                                                 |
| ---------------------------------------------------------------------------------------------- | ------- | ---------------- | ---------- | ---------- | ----------------------------------------------------------------- |
| - [subnetworks_to_nat](#items_cloud_nat_allOf_i0_then_subnetworks_to_nat )                     | No      | enum (of string) | No         | -          | -                                                                 |
| - [log_config](#items_cloud_nat_allOf_i0_then_log_config )                                     | No      | enum (of string) | No         | -          | Enable logging for the NAT. Logs will be exported to Stackdriver. |
| - [min_ports_per_vm](#items_cloud_nat_allOf_i0_then_min_ports_per_vm )                         | No      | integer          | No         | -          | Minimum number of ports allocated to a VM from this NAT.          |
| - [udp_idle_timeout](#items_cloud_nat_allOf_i0_then_udp_idle_timeout )                         | No      | integer          | No         | -          | Timeout in seconds for UDP connections.                           |
| - [icmp_idle_timeout](#items_cloud_nat_allOf_i0_then_icmp_idle_timeout )                       | No      | integer          | No         | -          | Timeout in seconds for ICMP connections.                          |
| - [tcp_established_idle_timeout](#items_cloud_nat_allOf_i0_then_tcp_established_idle_timeout ) | No      | integer          | No         | -          | Timeout in seconds for TCP established connections.               |
| - [tcp_transitory_idle_timeout](#items_cloud_nat_allOf_i0_then_tcp_transitory_idle_timeout )   | No      | integer          | No         | -          | Timeout in seconds for TCP transitory connections.                |
|                                                                                                |         |                  |            |            |                                                                   |

<details>
<summary><strong> <a name="items_cloud_nat_allOf_i0_then_subnetworks_to_nat"></a>1.8.4.1.1. [Optional] Property Networks > items > cloud_nat > allOf > All Primary and Secondary Subnetworks > then > subnetworks_to_nat</strong>  

</summary>
<blockquote>

| Type                      | `enum (of string)`                                                                                                  |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `"DISABLED"`                                                                                                        |
|                           |                                                                                                                     |

Must be one of:
* "ALL_PRIMARY_SUBNETWORKS_ALL_SECONDARY_SUBNETWORKS"
* "ALL_PRIMARY_SUBNETWORKS"
* "DISABLED"

</blockquote>
</details>

<details>
<summary><strong> <a name="items_cloud_nat_allOf_i0_then_log_config"></a>1.8.4.1.2. [Optional] Property Networks > items > cloud_nat > allOf > All Primary and Secondary Subnetworks > then > log_config</strong>  

</summary>
<blockquote>

| Type                      | `enum (of string)`                                                                                                  |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `"DISABLED"`                                                                                                        |
|                           |                                                                                                                     |

**Description:** Enable logging for the NAT. Logs will be exported to Stackdriver.

Must be one of:
* "ALL"
* "ERRORS_ONLY"
* "TRANSLATIONS_ONLY"
* "DISABLED"

</blockquote>
</details>

<details>
<summary><strong> <a name="items_cloud_nat_allOf_i0_then_min_ports_per_vm"></a>1.8.4.1.3. [Optional] Property Networks > items > cloud_nat > allOf > All Primary and Secondary Subnetworks > then > min_ports_per_vm</strong>  

</summary>
<blockquote>

| Type                      | `integer`                                                                                                           |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `64`                                                                                                                |
|                           |                                                                                                                     |

**Description:** Minimum number of ports allocated to a VM from this NAT.

</blockquote>
</details>

<details>
<summary><strong> <a name="items_cloud_nat_allOf_i0_then_udp_idle_timeout"></a>1.8.4.1.4. [Optional] Property Networks > items > cloud_nat > allOf > All Primary and Secondary Subnetworks > then > udp_idle_timeout</strong>  

</summary>
<blockquote>

| Type                      | `integer`                                                                                                           |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `30`                                                                                                                |
|                           |                                                                                                                     |

**Description:** Timeout in seconds for UDP connections.

</blockquote>
</details>

<details>
<summary><strong> <a name="items_cloud_nat_allOf_i0_then_icmp_idle_timeout"></a>1.8.4.1.5. [Optional] Property Networks > items > cloud_nat > allOf > All Primary and Secondary Subnetworks > then > icmp_idle_timeout</strong>  

</summary>
<blockquote>

| Type                      | `integer`                                                                                                           |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `30`                                                                                                                |
|                           |                                                                                                                     |

**Description:** Timeout in seconds for ICMP connections.

</blockquote>
</details>

<details>
<summary><strong> <a name="items_cloud_nat_allOf_i0_then_tcp_established_idle_timeout"></a>1.8.4.1.6. [Optional] Property Networks > items > cloud_nat > allOf > All Primary and Secondary Subnetworks > then > tcp_established_idle_timeout</strong>  

</summary>
<blockquote>

| Type                      | `integer`                                                                                                           |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `120`                                                                                                               |
|                           |                                                                                                                     |

**Description:** Timeout in seconds for TCP established connections.

</blockquote>
</details>

<details>
<summary><strong> <a name="items_cloud_nat_allOf_i0_then_tcp_transitory_idle_timeout"></a>1.8.4.1.7. [Optional] Property Networks > items > cloud_nat > allOf > All Primary and Secondary Subnetworks > then > tcp_transitory_idle_timeout</strong>  

</summary>
<blockquote>

| Type                      | `integer`                                                                                                           |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `30`                                                                                                                |
|                           |                                                                                                                     |

**Description:** Timeout in seconds for TCP transitory connections.

</blockquote>
</details>

</blockquote>
<blockquote>

#### <a name="items_cloud_nat_allOf_i4"></a>1.8.5. Property `Networks > items > cloud_nat > allOf > [DISABLED] Selected Primary Subnetworks and Selected Secondary Subnetworks`

**Title:** [DISABLED] Selected Primary Subnetworks and Selected Secondary Subnetworks

| Type                      | `object`                                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

**Description:** Disabled placeholder for SELECTED cloud nat, when DISABLED nothing is configured within GCP

##### <a name="autogenerated_heading_9"></a>1.8.5.1. If (subnetworks_to_nat = "DISABLED")

| Type                      | `object`                                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Defined in**            | #/definitions/selected                                                                                              |
|                           |                                                                                                                     |

| Property                                                                   | Pattern | Type             | Deprecated | Definition | Title/Description |
| -------------------------------------------------------------------------- | ------- | ---------------- | ---------- | ---------- | ----------------- |
| - [subnetworks_to_nat](#items_cloud_nat_allOf_i2_then_subnetworks_to_nat ) | No      | enum (of string) | No         | -          | -                 |
| - [nat_groups](#items_cloud_nat_allOf_i2_then_nat_groups )                 | No      | array of object  | No         | -          | -                 |
|                                                                            |         |                  |            |            |                   |

<details>
<summary><strong> <a name="items_cloud_nat_allOf_i2_then_subnetworks_to_nat"></a>1.8.5.1.1. [Optional] Property Networks > items > cloud_nat > allOf > Selected Primary Subnetworks and Selected Secondary Subnetworks > then > subnetworks_to_nat</strong>  

</summary>
<blockquote>

| Type                      | `enum (of string)`                                                                                                  |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `"DISABLED"`                                                                                                        |
|                           |                                                                                                                     |

Must be one of:
* "SELECTED_PRIMARY_SUBNETWORKS_SELECTED_SECONDARY_SUBNETWORKS"
* "DISABLED"

</blockquote>
</details>

<details>
<summary><strong> <a name="items_cloud_nat_allOf_i2_then_nat_groups"></a>1.8.5.1.2. [Optional] Property Networks > items > cloud_nat > allOf > Selected Primary Subnetworks and Selected Secondary Subnetworks > then > nat_groups</strong>  

</summary>
<blockquote>

| Type                      | `array of object`                                                                                                   |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

|                      | Array restrictions |
| -------------------- | ------------------ |
| **Min items**        | 0                  |
| **Max items**        | N/A                |
| **Items unicity**    | True               |
| **Additional items** | False              |
| **Tuple validation** | See below          |
|                      |                    |

| Each item of this array must be                          | Description |
| -------------------------------------------------------- | ----------- |
| [items](#items_cloud_nat_allOf_i2_then_nat_groups_items) | -           |
|                                                          |             |

##### <a name="items_cloud_nat_allOf_i2_then_nat_groups_items"></a>1.8.5.1.2.1. Networks > items > cloud_nat > allOf > Selected Primary Subnetworks and Selected Secondary Subnetworks > then > nat_groups > items

| Type                      | `object`                                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

| Property                                                                                                        | Pattern | Type             | Deprecated | Definition | Title/Description                                                 |
| --------------------------------------------------------------------------------------------------------------- | ------- | ---------------- | ---------- | ---------- | ----------------------------------------------------------------- |
| + [nat_group_id](#items_cloud_nat_allOf_i2_then_nat_groups_items_nat_group_id )                                 | No      | string           | No         | -          | -                                                                 |
| - [log_config](#items_cloud_nat_allOf_i2_then_nat_groups_items_log_config )                                     | No      | enum (of string) | No         | -          | Enable logging for the NAT. Logs will be exported to Stackdriver. |
| - [min_ports_per_vm](#items_cloud_nat_allOf_i2_then_nat_groups_items_min_ports_per_vm )                         | No      | integer          | No         | -          | Minimum number of ports allocated to a VM from this NAT.          |
| - [udp_idle_timeout](#items_cloud_nat_allOf_i2_then_nat_groups_items_udp_idle_timeout )                         | No      | integer          | No         | -          | Timeout in seconds for UDP connections.                           |
| - [icmp_idle_timeout](#items_cloud_nat_allOf_i2_then_nat_groups_items_icmp_idle_timeout )                       | No      | integer          | No         | -          | Timeout in seconds for ICMP connections.                          |
| - [tcp_established_idle_timeout](#items_cloud_nat_allOf_i2_then_nat_groups_items_tcp_established_idle_timeout ) | No      | integer          | No         | -          | Timeout in seconds for TCP established connections.               |
| - [tcp_transitory_idle_timeout](#items_cloud_nat_allOf_i2_then_nat_groups_items_tcp_transitory_idle_timeout )   | No      | integer          | No         | -          | Timeout in seconds for TCP transitory connections.                |
|                                                                                                                 |         |                  |            |            |                                                                   |

<details>
<summary><strong> <a name="items_cloud_nat_allOf_i2_then_nat_groups_items_nat_group_id"></a>1.8.5.1.2.1.1. [Required] Property Networks > items > cloud_nat > allOf > Selected Primary Subnetworks and Selected Secondary Subnetworks > then > nat_groups > items > nat_group_id</strong>  

</summary>
<blockquote>

| Type                      | `string`                                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

</blockquote>
</details>

<details>
<summary><strong> <a name="items_cloud_nat_allOf_i2_then_nat_groups_items_log_config"></a>1.8.5.1.2.1.2. [Optional] Property Networks > items > cloud_nat > allOf > Selected Primary Subnetworks and Selected Secondary Subnetworks > then > nat_groups > items > log_config</strong>  

</summary>
<blockquote>

| Type                      | `enum (of string)`                                                                                                  |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `"DISABLED"`                                                                                                        |
|                           |                                                                                                                     |

**Description:** Enable logging for the NAT. Logs will be exported to Stackdriver.

Must be one of:
* "ALL"
* "ERRORS_ONLY"
* "TRANSLATIONS_ONLY"
* "DISABLED"

</blockquote>
</details>

<details>
<summary><strong> <a name="items_cloud_nat_allOf_i2_then_nat_groups_items_min_ports_per_vm"></a>1.8.5.1.2.1.3. [Optional] Property Networks > items > cloud_nat > allOf > Selected Primary Subnetworks and Selected Secondary Subnetworks > then > nat_groups > items > min_ports_per_vm</strong>  

</summary>
<blockquote>

| Type                      | `integer`                                                                                                           |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `64`                                                                                                                |
|                           |                                                                                                                     |

**Description:** Minimum number of ports allocated to a VM from this NAT.

</blockquote>
</details>

<details>
<summary><strong> <a name="items_cloud_nat_allOf_i2_then_nat_groups_items_udp_idle_timeout"></a>1.8.5.1.2.1.4. [Optional] Property Networks > items > cloud_nat > allOf > Selected Primary Subnetworks and Selected Secondary Subnetworks > then > nat_groups > items > udp_idle_timeout</strong>  

</summary>
<blockquote>

| Type                      | `integer`                                                                                                           |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `30`                                                                                                                |
|                           |                                                                                                                     |

**Description:** Timeout in seconds for UDP connections.

</blockquote>
</details>

<details>
<summary><strong> <a name="items_cloud_nat_allOf_i2_then_nat_groups_items_icmp_idle_timeout"></a>1.8.5.1.2.1.5. [Optional] Property Networks > items > cloud_nat > allOf > Selected Primary Subnetworks and Selected Secondary Subnetworks > then > nat_groups > items > icmp_idle_timeout</strong>  

</summary>
<blockquote>

| Type                      | `integer`                                                                                                           |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `30`                                                                                                                |
|                           |                                                                                                                     |

**Description:** Timeout in seconds for ICMP connections.

</blockquote>
</details>

<details>
<summary><strong> <a name="items_cloud_nat_allOf_i2_then_nat_groups_items_tcp_established_idle_timeout"></a>1.8.5.1.2.1.6. [Optional] Property Networks > items > cloud_nat > allOf > Selected Primary Subnetworks and Selected Secondary Subnetworks > then > nat_groups > items > tcp_established_idle_timeout</strong>  

</summary>
<blockquote>

| Type                      | `integer`                                                                                                           |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `120`                                                                                                               |
|                           |                                                                                                                     |

**Description:** Timeout in seconds for TCP established connections.

</blockquote>
</details>

<details>
<summary><strong> <a name="items_cloud_nat_allOf_i2_then_nat_groups_items_tcp_transitory_idle_timeout"></a>1.8.5.1.2.1.7. [Optional] Property Networks > items > cloud_nat > allOf > Selected Primary Subnetworks and Selected Secondary Subnetworks > then > nat_groups > items > tcp_transitory_idle_timeout</strong>  

</summary>
<blockquote>

| Type                      | `integer`                                                                                                           |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `30`                                                                                                                |
|                           |                                                                                                                     |

**Description:** Timeout in seconds for TCP transitory connections.

</blockquote>
</details>

</blockquote>
</details>

</blockquote>

</blockquote>

</blockquote>
</details>

<details>
<summary><strong> <a name="items_peers"></a>1.9. [Optional] Property Networks > items > peers</strong>  

</summary>
<blockquote>

| Type                      | `array of object`                                                                                                   |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

|                      | Array restrictions |
| -------------------- | ------------------ |
| **Min items**        | N/A                |
| **Max items**        | N/A                |
| **Items unicity**    | False              |
| **Additional items** | False              |
| **Tuple validation** | See below          |
|                      |                    |

| Each item of this array must be | Description |
| ------------------------------- | ----------- |
| [items](#items_peers_items)     | -           |
|                                 |             |

#### <a name="items_peers_items"></a>1.9.1. Networks > items > peers > items

| Type                      | `object`                                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

| Property                                                                                         | Pattern | Type    | Deprecated | Definition | Title/Description |
| ------------------------------------------------------------------------------------------------ | ------- | ------- | ---------- | ---------- | ----------------- |
| - [project](#items_peers_items_project )                                                         | No      | string  | No         | -          | -                 |
| + [network](#items_peers_items_network )                                                         | No      | string  | No         | -          | -                 |
| - [export_custom_routes](#items_peers_items_export_custom_routes )                               | No      | boolean | No         | -          | -                 |
| - [import_custom_routes](#items_peers_items_import_custom_routes )                               | No      | boolean | No         | -          | -                 |
| - [import_subnet_routes_with_public_ip](#items_peers_items_import_subnet_routes_with_public_ip ) | No      | boolean | No         | -          | -                 |
| - [export_subnet_routes_with_public_ip](#items_peers_items_export_subnet_routes_with_public_ip ) | No      | boolean | No         | -          | -                 |
|                                                                                                  |         |         |            |            |                   |

<details>
<summary><strong> <a name="items_peers_items_project"></a>1.9.1.1. [Optional] Property Networks > items > peers > items > project</strong>  

</summary>
<blockquote>

| Type                      | `string`                                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `null`                                                                                                              |
|                           |                                                                                                                     |

</blockquote>
</details>

<details>
<summary><strong> <a name="items_peers_items_network"></a>1.9.1.2. [Required] Property Networks > items > peers > items > network</strong>  

</summary>
<blockquote>

| Type                      | `string`                                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
|                           |                                                                                                                     |

</blockquote>
</details>

<details>
<summary><strong> <a name="items_peers_items_export_custom_routes"></a>1.9.1.3. [Optional] Property Networks > items > peers > items > export_custom_routes</strong>  

</summary>
<blockquote>

| Type                      | `boolean`                                                                                                           |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `false`                                                                                                             |
|                           |                                                                                                                     |

</blockquote>
</details>

<details>
<summary><strong> <a name="items_peers_items_import_custom_routes"></a>1.9.1.4. [Optional] Property Networks > items > peers > items > import_custom_routes</strong>  

</summary>
<blockquote>

| Type                      | `boolean`                                                                                                           |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `false`                                                                                                             |
|                           |                                                                                                                     |

</blockquote>
</details>

<details>
<summary><strong> <a name="items_peers_items_import_subnet_routes_with_public_ip"></a>1.9.1.5. [Optional] Property Networks > items > peers > items > import_subnet_routes_with_public_ip</strong>  

</summary>
<blockquote>

| Type                      | `boolean`                                                                                                           |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `false`                                                                                                             |
|                           |                                                                                                                     |

</blockquote>
</details>

<details>
<summary><strong> <a name="items_peers_items_export_subnet_routes_with_public_ip"></a>1.9.1.6. [Optional] Property Networks > items > peers > items > export_subnet_routes_with_public_ip</strong>  

</summary>
<blockquote>

| Type                      | `boolean`                                                                                                           |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Additional properties** | [![badge](https://img.shields.io/badge/Any+type-allowed-green)](# "Additional Properties of any type are allowed.") |
| **Default**               | `false`                                                                                                             |
|                           |                                                                                                                     |

</blockquote>
</details>

</blockquote>
</details>

----------------------------------------------------------------------------------------------------------------------------
Generated using [json-schema-for-humans](https://github.com/coveooss/json-schema-for-humans) on 2021-10-17 at 12:07:49 -0700