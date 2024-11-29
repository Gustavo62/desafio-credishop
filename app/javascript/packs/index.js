import Chart from 'chart.js/auto'

document.addEventListener('DOMContentLoaded', () => {
    const ctx = document.getElementById('pie-chart-proponent').getContext('2d');
    const data = {
        labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
        datasets: [{
          label: '# of Votes',
          data: [12, 19, 3, 5, 2, 3],
          borderWidth: 1,
          backgroundColor: ['#CB4335', '#1F618D', '#F1C40F', '#27AE60', '#884EA0', '#D35400'],
        }]
    };
    const config = {
        type: 'pie',
        data: data,
        options: {
          plugins: {
            legend: {
              onHover: handleHover,
              onLeave: handleLeave
            }
          }
        }
    };

    const myChart = new Chart(ctx, config);
});

function handleHover(evt, item, legend) {
    legend.chart.data.datasets[0].backgroundColor.forEach((color, index, colors) => {
      colors[index] = index === item.index || color.length === 9 ? color : color + '4D';
    });
    legend.chart.update();
}

function handleLeave(evt, item, legend) {
    legend.chart.data.datasets[0].backgroundColor.forEach((color, index, colors) => {
      colors[index] = color.length === 9 ? color.slice(0, -2) : color;
    });
    legend.chart.update();
}
// Função para gerar meses (como substituto do `Utils.months`)
function getMonths(count) {
    const months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
    return months.slice(0, count);
}

// Função para gerar dados aleatórios (como substituto do `Utils.numbers`)
function generateRandomData(count) {
    return Array.from({ length: count }, () => Math.floor(Math.random() * 100));
}
