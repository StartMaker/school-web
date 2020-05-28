class User {
    String username;
    String password;
    String phone;
    String avatar;

    User({
        this.username,
        this.password,
        this.avatar = 'http://i2.hdslb.com/bfs/face/d79637d472c90f45b2476871a3e63898240a47e3.jpg',
        this.phone
    }): super();

    List<Map<String, dynamic>> toList() {
        return [
            {
                'key': 'avatar',
                'name': '头像',
                'data': this.avatar
            },
            {
                'key': 'username',
                'name': '账号',
                'data': this.username
            },
            {
                'key': 'password',
                'name': '密码',
                'data': this.password
            },
            {
                'key': 'phone',
                'name': '电话',
                'data': this.phone
            }
        ];
    }
}