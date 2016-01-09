
//MARK:  SQLite

//MARK: - 什么是 SQLite？

* `SQLite` 是一个进程内的库，是一个 SQL 数据库引擎，具有：
* 自给自足
* 不需要任何外部的依赖
* 无服务器
* 不需要一个单独的服务器进程或操作的系统
* 零配置
* 不需要安装或管理
* 一个完整的 SQLite 数据库就是一个单一的磁盘文件
* 轻量级
* 完全配置时小于 400K，省略可选功能配置时小于250K
* 事务性支持

//MARK: - SQLite 命令

//MARK: - DDL - 数据定义语言
| 命令 | 描述 |
| -- | -- |
| CREATE | 创建一个新的表，一个表的视图，或者数据库中的其他对象 |
| ALTER | 修改数据库中的某个已有的数据库对象，比如一个表 |
| DROP | 删除整个表，或者表的视图，或者数据库中的其他对象 |

//MARK: - DML - 数据操作语言

| 命令 | 描述 |
| -- | -- |
| INSERT | 新增 |
| UPDATE | 修改 |
| DELETE | 删除 |

//MARK: - DQL - 数据查询语言

| 命令 | 描述 |
| -- | -- |
| SELECT | 查询 |












//MARK:  核心对象 & 核心接口

//MARK: - 核心对象

1. database_connection
* 由 `sqlite3_open` 函数创建并返回
* 在使用其他 SQLite 接口函数之前，必须先获得database_connnection对象

2. prepared_statement
* 可以简单的将它视为编译后的SQL语句

//MARK: - 核心接口

1. sqlite3_open
* 可以打开已经存在的数据库文件
* 如果数据库不存在，可以创建新的数据库文件
* 返回的 `database_connection` 对象是其他 `SQLite APIs` 的句柄参数
* 可以在多个线程之间共享该对象指针

2. sqlite3_prepare
* 将 `SQL` 文本转换为 `prepared_statement` 对象
* 不会`执行`指定的 `SQL` 语句
* 只是将 `SQL` 文本初始化为`待`执行的状态

3. sqlite3_step
* 执行一次 `sqlite3_prepare` 函数返回的 `prepared_statement` 对象
* 执行完该函数后，`prepared_statement` 对象的内部指针将指向其返回结果集的第一行
* 如果要获得后续的数据行，则需要不断地调用该函数，直到所有的数据行遍历完毕
* 对于 `INSERT`、`UPDATE` 和 `DELETE` 等 `DML` 语句，执行一次即可完成

4. sqlite3_column
* 用于获取当前行指定列的数据
* 以下函数分别对应不同的数据类型
* `sqlite3_column_blob`
* `sqlite3_column_bytes`
* `sqlite3_column_bytes16`
* `sqlite3_column_double`
* `sqlite3_column_int`
* `sqlite3_column_int64`
* `sqlite3_column_text`
* `sqlite3_column_text16`
* `sqlite3_column_type`
* `sqlite3_column_value`
* `sqlite3_column_count`
* 用于获取当前结果集中的字段数量

5. sqlite3_finalize
* 销毁 `prepared_statement` 对象，否则会造成内存泄露

6. sqlite3_close
* 关闭之前打开的 `database_connection` 对象
* 所有和该对象相关的 `prepared_statements` 对象都必须在此之前被销毁



//MARK:  数据准备

//MARK: - 部门表

sql
//MARK:创建部门表
CREATE TABLE
IF NOT EXISTS T_Department (
id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, -- 部门代号
DepartmentNo CHAR(10) NOT NULL DEFAULT '', -- 部门编号
Name CHAR(50) NOT NULL DEFAULT '' -- 部门名称
);

//MARK:删除数据表
DROP TABLE T_Department;

//MARK:新增数据
INSERT INTO T_Department (DepartmentNo, Name) VALUES ('001', '总经理办公室');
INSERT INTO T_Department (DepartmentNo, Name) VALUES ('002', '市场部');
INSERT INTO T_Department (DepartmentNo, Name) VALUES ('003', '销售部');
INSERT INTO T_Department (DepartmentNo, Name) VALUES ('004', '财务部');
INSERT INTO T_Department (DepartmentNo, Name) VALUES ('005', '软件部');

//MARK:查询数据
SELECT * FROM T_Department
ORDER BY DepartmentNo;

//MARK:更新数据
UPDATE T_Department SET Name = '总经办' WHERE id = '1';

//MARK:删除数据
DELETE FROM T_Department WHERE id = 4;


//MARK: - 员工表

sql
//MARK:创建数据表
CREATE TABLE
IF NOT EXISTS T_Employee (
id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, -- 员工代号
Name CHAR (50) NOT NULL, -- 姓名
Age INTEGER NOT NULL, -- 年龄
DepartmentID INTEGER, -- 部门代号
CONSTRAINT "FK_DEP_ID" FOREIGN KEY ("DepartmentID") REFERENCES "T_Department" ("id")
);

//MARK:删除数据表
DROP TABLE T_Employee;

//MARK:新增数据
INSERT INTO T_Employee (Name, Age, DepartmentID) VALUES ('zs', 26, 2);
INSERT INTO T_Employee (Name, Age, DepartmentID) VALUES ('ls', 24, 3);
INSERT INTO T_Employee (Name, Age, DepartmentID) VALUES ('ww', 28, 5);

//MARK:查询所有数据
SELECT * FROM T_Employee;

-- 测试删除有外键关联的数据
--DELETE FROM T_Department WHERE id = 5;


//MARK: - 工资表

sql
//MARK:创建数据表
CREATE TABLE
IF NOT EXISTS T_Salary (
id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, -- 工资代号
SalaryDate CHAR(10) NOT NULL, -- 发放日期
EmployeeID INTEGER, -- 员工代号
Salary REAL CHECK(Salary > 0), -- 工资
CONSTRAINT "FK_EMP_ID" FOREIGN KEY ("EmployeeID") REFERENCES "T_Employee" ("id")
);

//MARK:删除数据表
DROP TABLE T_Salary;

//MARK:插入数据
INSERT INTO T_Salary (SalaryDate, EmployeeID, Salary) VALUES ('201501', 1, 1000);
INSERT INTO T_Salary (SalaryDate, EmployeeID, Salary) VALUES ('201501', 2, 1500);
INSERT INTO T_Salary (SalaryDate, EmployeeID, Salary) VALUES ('201501', 3, 2000);
INSERT INTO T_Salary (SalaryDate, EmployeeID, Salary) VALUES ('201502', 1, 1200);
INSERT INTO T_Salary (SalaryDate, EmployeeID, Salary) VALUES ('201502', 2, 1400);
INSERT INTO T_Salary (SalaryDate, EmployeeID, Salary) VALUES ('201502', 3, 2100);


//MARK:选择数据
SELECT * FROM T_Salary;

//MARK:查询最大值，平均值，总数
SELECT MAX(Salary), AVG(Salary), COUNT(*) FROM T_Salary
WHERE SalaryDate = '201502';





//MARK:  Swift中使用SQLite

//MARK: - 使用步骤

1. 导入 sqlite 动态库 `libsqlite3.dylib`
2. 添加 `bridge.h`
3. `//MARK: import <sqlite3.h>`
4. 新建文件 `SQLite.swift`

//MARK: - 打开数据库


class SQLite {
    
    private static let instance = SQLite()
    class var sharedInstance: SQLite {
        return instance
    }
    
    /// 定义 SQLiteDB 指针类型
    typealias SQLiteDBPointer = COpaquePointer
    
    /// database_connection 对象
    private var db: SQLiteDBPointer = nil;
    
    //MARK:打开数据库
    func openDatabase(dbName: String) {
        let path = dbName.documentPath()
        let result = sqlite3_open(path.cStringUsingEncoding(NSUTF8StringEncoding)!, &db)
        
        if result == SQLITE_OK {
            println("打开数据库成功")
        } else {
            println("打开数据库失败")
        }
    }
}


//MARK: - 执行查询语句


//MARK:执行查询语句
func execSQL(sql: String) -> Bool {
    return sqlite3_exec(db, sql.cStringUsingEncoding(NSUTF8StringEncoding)!, nil, nil, nil) == SQLITE_OK
}


//MARK: - 创建数据表


//MARK:创建数据表
func createTable() {
    var result = false
    var sql = "CREATE TABLE\n" +
        "IF NOT EXISTS T_Department (\n" +
        "id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, -- 部门代号\n" +
        "DepartmentNo CHAR(10) NOT NULL DEFAULT '', -- 部门编号\n" +
        "Name CHAR(50) NOT NULL DEFAULT '' -- 部门名称\n" +
    ");\n"
    result = execSQL(sql)
    
    if result {
        sql = "CREATE TABLE \n" +
            "IF NOT EXISTS T_Employee (\n" +
            "id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, -- 员工代号\n" +
            "Name CHAR (50) NOT NULL, -- 姓名\n" +
            "Age INTEGER NOT NULL, -- 年龄\n" +
            "DepartmentID INTEGER, -- 部门代号\n" +
            "CONSTRAINT 'FK_DEP_ID' FOREIGN KEY ('DepartmentID') REFERENCES 'T_Department' ('id')\n" +
        ");"
        result = execSQL(sql)
    }
    
    if result {
        sql = "CREATE TABLE\n" +
            "IF NOT EXISTS T_Salary (\n" +
            "id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, -- 工资代号\n" +
            "SalaryDate CHAR(10) NOT NULL, -- 发放日期\n" +
            "EmployeeID INTEGER, -- 员工代号\n" +
            "Salary REAL CHECK(Salary > 0), -- 工资\n" +
            "CONSTRAINT 'FK_EMP_ID' FOREIGN KEY ('EmployeeID') REFERENCES 'T_Employee' ('id')\n" +
        ");\n"
        result = execSQL(sql)
    }
    
    if result {
        println("创表成功")
    } else {
        println("创表失败")
    }
}



//MARK:  批量插入大量数据


//MARK:批量插入数据
var db: COpaquePointer = nil
var stmt: COpaquePointer = nil

func batchEmployee() {
    let path = "my.db".documentPath()
    println(path)
    // 打开数据库
    sqlite3_open(path.cStringUsingEncoding(NSUTF8StringEncoding)!, &db)
    sqlite3_exec(db, "BEGIN TRANSACTION", nil, nil, nil)
    
    let sql = "INSERT INTO T_Employee (Name, Age, DepartmentID) VALUES (?, ?, ?);"
    
    let start = CFAbsoluteTimeGetCurrent()
    if sqlite3_prepare_v2(db, sql.cStringUsingEncoding(NSUTF8StringEncoding)!, -1, &stmt, nil) == SQLITE_OK {
        for i in 0...100000 {
            let name = "zhangsan-\(i)"
            let age = Int(arc4random_uniform(40) + 20)
            
            insertPerson(name, age: age, depId: 1)
        }
    }
    sqlite3_finalize(stmt)
    
    // 开启排他模式事务
    if sqlite3_exec(db, "COMMIT EXCLUSIVE TRANSACTION", nil, nil, nil) != SQLITE_OK {
        let errmsg = String.fromCString(sqlite3_errmsg(db))
        println("提交错误 \(errmsg)")
    }
    println("耗时： \(CFAbsoluteTimeGetCurrent() - start)")
}
internal let SQLITE_TRANSIENT = sqlite3_destructor_type(COpaquePointer(bitPattern: -1))

//MARK:批量执行
func insertPerson(name: String, age: Int, depId: Int) {
    
    sqlite3_bind_text(stmt, 1, name.cStringUsingEncoding(NSUTF8StringEncoding)!, -1, SQLITE_TRANSIENT)
    sqlite3_bind_int64(stmt, 2, sqlite3_int64(age))
    sqlite3_bind_int64(stmt, 3, sqlite3_int64(depId))
    
    // 执行了一句
    if sqlite3_step(stmt) != SQLITE_DONE {
        println("插入失败")
    }
    if sqlite3_reset(stmt) != SQLITE_OK {
        println("重置错误")
    }
}




//MARK:  记录数组

c
//MARK:执行 SQL 返回结果数组
func execRecordSet(sql: String) -> [AnyObject]? {
    
    // 1. 准备 sql
    var stmt: SQLiteSTMTPointer = nil
    
    if sqlite3_prepare_v2(db, sql.cStringUsingEncoding(NSUTF8StringEncoding)!, -1, &stmt, nil) == SQLITE_OK {
        
        while sqlite3_step(stmt) == SQLITE_ROW {
            // 打印查询结果列数
            println(sqlite3_column_count(stmt))
        }
    }
    
    // 释放语句
    sqlite3_finalize(stmt)
    
    return nil
}


//MARK: - 取出一行数据

c
/// 返回一行数据数组
private func rowData(stmt: SQLiteSTMTPointer) -> [AnyObject] {
    
    var array = [AnyObject]()
    for i in 0..<sqlite3_column_count(stmt) {
        
        switch sqlite3_column_type(stmt, i) {
        case SQLITE_FLOAT:
            array.append(sqlite3_column_double(stmt, i))
        case SQLITE_INTEGER:
            array.append(Int(sqlite3_column_int64(stmt, i)))
        case SQLITE_TEXT:
            var chars: UnsafePointer<CChar> = (UnsafePointer<CChar>)(sqlite3_column_text(stmt, i))
            array.append(String.fromCString(chars)!)
        case SQLITE_NULL:
            array.append(NSNull())
        case let type:
            println("不支持的类型 \(type)")
        }
    }
    return array
}


//MARK: - 修改查询算法

c
//MARK:执行 SQL 返回结果数组
func execRecordSet(sql: String) -> [AnyObject] {
    
    // 1. 准备 sql
    var stmt: SQLiteSTMTPointer = nil
    
    var recordList = [AnyObject]()
    if sqlite3_prepare_v2(db, sql.cStringUsingEncoding(NSUTF8StringEncoding)!, -1, &stmt, nil) == SQLITE_OK {
        
        while sqlite3_step(stmt) == SQLITE_ROW {
            recordList.append(rowData(stmt))
        }
    }
    
    // 释放语句
    sqlite3_finalize(stmt)
    
    return recordList
}


