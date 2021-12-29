DATABASES = {
    'default' : {
        'ENGINE': 'django.db.backends.mysql',    #사용할 엔진 설정. 그대로 두면 된다고 합니다
        'NAME': 'django_board',                   #연동할 MySQL의 데이터베이스 이름
        'USER': 'root',                          #DB 접속 계정명
        'PASSWORD': '1234',                      #해당 DB접속 계정 비밀번호
        'HOST': 'localhost',                     #실제 DB 주소
        'PORT': '3307',                          #port ->저는 8버전을 3306포트에 5버전을 3307포트에 깔아서 5버전을 사용하기 위해 3307포트를 사용.
    }
}
