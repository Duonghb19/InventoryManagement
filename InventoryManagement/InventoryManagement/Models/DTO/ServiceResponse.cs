namespace InventoryManagement.Models
{
    /// <summary>
    /// Class chứa thông tin trả về cho client từ service
    /// </summary>
    public class ServiceResponse
    {
        /// <summary>
        /// Trạng thái của response
        /// </summary>
        public bool Success { get; set; }

        /// <summary>
        /// Thông điệp trả về cho client
        /// </summary>
        public string Message { get; set; }

        /// <summary>
        /// Dữ liệu trả về cho client
        /// </summary>
        public object Data { get; set; }

        /// <summary>
        /// Mã lỗi
        /// </summary>
        public int? ErrorCode { get; set; }

        public void OnSuccess(object data = null, string message = null)
        {
            Success = true;
            Message = message;
            Data = data;
        }
        public void OnSuccess(string message = null)
        {
            Success = true;
            Message = message;
        }


        public void OnError(object data = null, string message = null)
        {
            Success = false;
            Message = message;
            Data = data;
        }

        public void OnError(string message = null)
        {
            Success = false;
            Message = message;
        }
    }
}
