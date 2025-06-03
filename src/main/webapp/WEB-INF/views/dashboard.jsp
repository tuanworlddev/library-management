<%@ page contentType="text/html;charset=UTF-8" %>

<div class="container my-4">
  <h1 class="mb-4">Dashboard Quản Lý Thư Viện</h1>

  <div class="row g-4">
    <!-- Tổng số khách hàng -->
    <div class="col-md-3">
      <div class="card text-white bg-primary shadow-sm">
        <div class="card-body">
          <h5 class="card-title">Tổng số khách hàng</h5>
          <p class="card-text display-4">125</p>
          <i class="fa-solid fa-users fa-2x"></i>
        </div>
      </div>
    </div>

    <!-- Tổng số sách -->
    <div class="col-md-3">
      <div class="card text-white bg-success shadow-sm">
        <div class="card-body">
          <h5 class="card-title">Tổng số sách</h5>
          <p class="card-text display-4">840</p>
          <i class="fa-solid fa-book fa-2x"></i>
        </div>
      </div>
    </div>

    <!-- Sách đang được mượn -->
    <div class="col-md-3">
      <div class="card text-white bg-warning shadow-sm">
        <div class="card-body">
          <h5 class="card-title">Sách đang mượn</h5>
          <p class="card-text display-4">230</p>
          <i class="fa-solid fa-book-reader fa-2x"></i>
        </div>
      </div>
    </div>

    <!-- Khách hàng quá hạn trả -->
    <div class="col-md-3">
      <div class="card text-white bg-danger shadow-sm">
        <div class="card-body">
          <h5 class="card-title">Khách hàng quá hạn</h5>
          <p class="card-text display-4">15</p>
          <i class="fa-solid fa-exclamation-triangle fa-2x"></i>
        </div>
      </div>
    </div>
  </div>

  <!-- Biểu đồ mẫu (dùng Chart.js) -->
  <div class="card mt-5 shadow-sm">
    <div class="card-header">
      <h5>Biểu đồ số lượng sách mượn theo tháng</h5>
    </div>
    <div class="card-body">
      <canvas id="borrowChart" style="max-height: 300px;"></canvas>
    </div>
  </div>
</div>

<!-- Thêm thư viện Chart.js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
  const ctx = document.getElementById('borrowChart').getContext('2d');
  const borrowChart = new Chart(ctx, {
    type: 'bar',
    data: {
      labels: ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8'],
      datasets: [{
        label: 'Số lượng sách mượn',
        data: [50, 75, 60, 90, 120, 100, 80, 110],
        backgroundColor: 'rgba(13, 110, 253, 0.7)',
        borderColor: 'rgba(13, 110, 253, 1)',
        borderWidth: 1,
        borderRadius: 4
      }]
    },
    options: {
      scales: {
        y: {
          beginAtZero: true,
          ticks: { stepSize: 20 }
        }
      },
      responsive: true,
      plugins: {
        legend: { display: false }
      }
    }
  });
</script>
