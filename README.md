# EntityFramework Persistence Layer for IdentityServer3 #

Dev build: [![Build status](https://ci.appveyor.com/api/projects/status/e4t73mt1mid6vbdy?svg=true)](https://ci.appveyor.com/project/leastprivilege/thinktecture-identityserver-v3-entityframework)
[![Gitter](https://badges.gitter.im/Join Chat.svg)](https://gitter.im/IdentityServer/IdentityServer3?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

IdentityServer3.EntityFramework is a persistence layer for IdentityServer v3 configuration data that uses EntityFramework as it's database abstraction. 

Modifications of this fork specifically so it will work with MySql's EntityFramework.
1. MySql.EF6 has no implementation for DateTimeOffset. We change these properties to DateTime objects and assure UTC is always used.
