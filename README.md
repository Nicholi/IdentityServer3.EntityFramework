# EntityFramework Persistence Layer for IdentityServer3 #

Dev build: [![Build status](https://ci.appveyor.com/api/projects/status/e4t73mt1mid6vbdy?svg=true)](https://ci.appveyor.com/project/leastprivilege/thinktecture-identityserver-v3-entityframework)
[![Gitter](https://badges.gitter.im/Join Chat.svg)](https://gitter.im/IdentityServer/IdentityServer3?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

IdentityServer3.EntityFramework is a persistence layer for IdentityServer v3 configuration data that uses EntityFramework as it's database abstraction. 

Modifications of this fork specifically so it will work with MySql's EntityFramework library, MySql.Data.Entity. Check mydev branch.

1. MySql.Data.Entity.EF6 does not handle DateTimeOffset fields. We change these fields to DateTime and assure UTC is always used.
