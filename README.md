# Understanding-the-Security-Risks-of-Docker-Hub

Dataset for "[Understanding the Security Risks of Docker Hub](https://link.springer.com/chapter/10.1007%2F978-3-030-58951-6_13)" published in [ESORICS 2020](https://www.surrey.ac.uk/esorics-2020).

## BibTex

```txt
@inproceedings{peiyu2020understanding,
author = {Liu, Peiyu and Ji, Shouling and Fu, Lirong and Lu, Kangjie and Zhang, Xuhong and Lee, Wei-Han and Lu, Tao and Chen, Wenzhi and Beyah, Raheem},
title = {Understanding the Security Risks of Docker Hub},
booktitle = {Computer Security -- ESORICS 2020},
year = {2020},
pages = {257--276}
}
```

We collect the public information of `975,858` repositories, `2,227,244` images, and `349,860` developers on Docker Hub.

The dataset is available [here (Google Driver)](https://drive.google.com/drive/folders/1sOG19JM0X5k0s-AJsYvnppT3klc0YpWt?usp=sharing).

## repos-list.txt

The investigated repositories are listed in this file, in the form as `image_<namespace>_<repo_name>`.

```txt
...
image_belibak_mysql
image_belibak_python
image_belibak_selenium-server
image_belicosus_wl-visualize
image_belidor_apache
image_beliefchainorg_eth-testrpc
image_beliefchainorg_ethereum-bridge
...
```

## repos.tar

After extracting *repos.tar*, you can find the meta-information of each repository listed in *repos-list.txt*.

For example, the meta-information of the repository `belibak/mysql` can be found in *repos/image_belibak_mysql*.

```json
{
    "user": "belibak",
    "name": "mysql",
    "namespace": "belibak",
    "repository_type": "image",
    "status": 1,
    "description": "docker run -p 3306:3306 -d belibak/mysql",
    "is_private": false,
    "is_automated": false,
    "can_edit": false,
    "star_count": 0,
    "pull_count": 28,
    "last_updated": "2017-02-21T13:13:31.589061Z",
    "is_migrated": false,
    "has_starred": false,
    "full_description": "white\nregular_trash",
    "affiliation": null,
    "permissions":
    {
        "read": true,
        "write": false,
        "admin": false
    }
}
```

## tags.tar

After extracting *tags.tar*, you can find the meta-information of the images in each repository listed in *repos-list.txt*.

For example, the meta-information of the images in repository `belibak/mysql` can be found in *tags/tags_belibak_mysql*.

```json
{
    "count": 1,
    "next": null,
    "previous": null,
    "results": [
        {
            "name": "latest",
            "full_size": 52736256,
            "images": [
                {
                    "size": 52736256,
                    "architecture": "amd64",
                    "variant": null,
                    "features": null,
                    "os": "linux",
                    "os_version": null,
                    "os_features": null
                }
            ],
            "id": 8345794
            "repository": 1269944,
            "creator": 1271838
            "last_updater": 1271838,
            "last_updated": "2017-02-21T13:13:31.082200Z",
            "image_id": null,
            "v2": true
        }
    ]
}
```
