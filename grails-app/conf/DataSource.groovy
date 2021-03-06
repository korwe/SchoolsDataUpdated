dataSource {
    pooled = true
    driverClassName = "org.h2.Driver"
    username = "sa"
    password = ""
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}
// environment specific settings
environments {
    development {
    //    dataSource {
    //        dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
    //        url = "jdbc:h2:mem:devDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
    //    }

        dataSource {
            dbCreate = "update"
            driverClassName = "com.mysql.jdbc.Driver"
            url = "jdbc:mysql://localhost/schoolsData"
            username = "metrorailuser"
            password = "metrorailpassword"
            logSql = true
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
        }
    }
    production {
        dataSource {
            dbCreate = "update"
            driverClassName = "com.mysql.jdbc.Driver"
            url = "jdbc:mysql://localhost/schoolsData"
            username = "root"
            password = "korwe"
            logSql = false
            pooled = true
            properties {
                maxActive = 50
                minIdle = 2
                maxIdle = 20
                maxAge = 600000
                removeAbandoned = true
                minEvictableIdleTimeMillis=60000
                timeBetweenEvictionRunsMillis=30000
                numTestsPerEvictionRun=3
                testOnBorrow=true
                testWhileIdle=true
                testOnReturn=true
                validationQuery="SELECT 1"
            }
        }
    }
}
