class DioResponseBody{
    int code = 0;
    String msg = '';
    Map<String, dynamic> data;

    DioResponseBody(Map<String, dynamic> responseData) {
        this.code = responseData['code'];
        this.data = responseData['data'];
        this.msg = responseData['msg'];
    }
}