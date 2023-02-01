#include </usr/include/mysql/mysql.h>
#include <stdio.h>
#include <stdlib.h>

#define DB_HOST "125.128.104.134"  
#define DB_USER "azabellcode"  //여기다 아이디를 집어넣습니다.
#define DB_PASS "dkwkqpf!123@Dkwiela" // 여기다 패스워드를 집어넣습니다.
#define DB_NAME "azabellcode" //DB를 한 mysql에서 만들고 그 이름을 적습니다.

#define SQL_CREATE_TABLE "CREATE TABLE TEST (\
        ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,\
        NUM INT NULL ,\
        STRING VARCHAR( 20 ) NULL \
        ) DEFAULT CHARSET=utf8mb4;" //"
#define SQL_INSERT_RECORD "INSERT INTO TEST ( ID , NUM , STRING ) \
        VALUES (\
        NULL , '%d', '%s'\
        );" //"
#define SQL_SELECT_RECORD "SELECT * FROM TEST"
//#define SQL_DROP_TABLE "DROP TABLE `mysql_api_test`"

int main()
{
    MYSQL *connection=NULL, conn;
    MYSQL_RES *sql_result;
    MYSQL_ROW sql_row;
    int query_stat;
    int i;

    char query[255];

    mysql_init(&conn);

    // DB 연결
    connection = mysql_real_connect(&conn, "125.128.104.134",
        "azabellcode", "dkwkqpf!123@Dkwiela", "azabellcode", 2487,(char *)NULL, 0);
    if(connection==NULL)
    {
        fprintf(stderr, "Mysql connection error : %s", mysql_error(&conn));
        return 1;
    }

    // 테이블 생성
    query_stat=mysql_query(connection,SQL_CREATE_TABLE);
    if (query_stat != 0)
    {
        fprintf(stderr, "Mysql query error : %s", mysql_error(&conn));
        return 1;
    }

    // 레코드 삽입
    for(i=0;i<5;i++)
    {
        sprintf(query,SQL_INSERT_RECORD,100+i,"Hwi의 blog");
        query_stat = mysql_query(connection, query);
        if (query_stat != 0)
        {
            fprintf(stderr, "Mysql query error : %s", mysql_error(&conn));
            return 1;
        }
    }

    // 셀렉트
    query_stat=mysql_query(connection,SQL_SELECT_RECORD);
    if (query_stat != 0)
    {
        fprintf(stderr, "Mysql query error : %s", mysql_error(&conn));
        return 1;
    }

    // 결과 출력
    sql_result=mysql_store_result(connection);
    while((sql_row=mysql_fetch_row(sql_result))!=NULL)
    {
        printf("%2s %2s %s\n",sql_row[0],sql_row[1],sql_row[2]);
    }
    mysql_free_result(sql_result);

    // 테이블 삭제
    // query_stat=mysql_query(connection,SQL_DROP_TABLE);
    // if (query_stat != 0)
    // {
    //     fprintf(stderr, "Mysql query error : %s", mysql_error(&conn));
    //     return 1;
    // }

    // DB 연결 닫기
    mysql_close(connection);
    return 0;
}

