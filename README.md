ssh-config Cookbook
===================
A simple cookbook that updates either /etc/ssh/config or ~/.ssh/config based on the contents of a data bag

Requirements
------------

#### packages
- `chef-solo-search` - this cookbook uses search so the chef-solo-search cookbook is required if you are running chef-solo

Attributes
----------
#### ssh-config::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['ssh-config']['local_config']</tt></td>
    <td>Boolean</td>
    <td>Install the config locally for a user (~/.ssh/config) or globally (/etc/ssh/ssh_config)</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['ssh-config']['local_user']</tt></td>
    <td>String</td>
    <td>If local_user is set, which user will this update (the user needs to already exist)</td>
    <td><tt>ubuntu</tt></td>
  </tr>
  <tr>
    <td><tt>['ssh-config']['identityfile_dir']</tt></td>
    <td>String</td>
    <td>Folder that should prefix all identityfile attribtues</td>
    <td><tt>~/.ssh/keys</tt></td>
  </tr>
</table>

Usage
-----
#### ssh-config::default
Include `ssh-config` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[ssh-config]"
  ]
}
```
Create a data bag called `ssh_config` with items like the below

```json
{
  "id": "example",
  "hosts": [
    {
      "id": "webserver-1",
      "identityfile": "webserver.pem",
      "hostname": "10.0.0.1",
      "user": "ubuntu",
      "port": 22
    }
  ]
}
```

All data bag items in the data bag will be included in the config. Any key/value pair for the items in hosts is valid, the only required one is `id`

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Kieran Doonan
