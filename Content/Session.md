### Session
#### 세션 값 등록하기
```java
session.setAttribute(String name, Object obj);
session.setAttribute("id", id);
```

#### 세션 값 가져오기
```java
session.getAttribute(String name);
```

#### 세션 값 초기화
```java
session.invalidate();
```
