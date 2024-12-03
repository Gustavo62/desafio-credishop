import { Controller } from "stimulus"
import Chart from 'chart.js/auto'

export default class extends Controller {
  connect() {
    const ctx = document.getElementById('pie-chart-proponent').getContext('2d');

    const groupByDiscount = (proponents, discountRates) => {
      const groupedData = {};

      proponents.forEach((proponent) => {
        const group = proponent.group_discount;

        const discountRate = discountRates.find((rate) => rate.position === group);

        if (discountRate) {
          const label = `Grupo ${group} faixa R$ ${discountRate.min} - ${discountRate.max}`;
          groupedData[label] = (groupedData[label] || 0) + 1;
        }
      });

      return groupedData;
    };

    fetch('/proponents?per_page=all', {
      headers: {
        'Accept': 'application/json'
      }
    })
    .then((response) => response.json())
    .then((data) => {
      const { proponents: proponents, discount_rates: discountRates } = data;

      const groupedData = groupByDiscount(proponents, discountRates);

      const labels = Object.keys(groupedData);
      const values = Object.values(groupedData);

      const chartData = {
        labels: labels,
        datasets: [{
          label: 'Proponents por Grupo',
          data: values,
          borderWidth: 1,
          backgroundColor: ['#CB4335', '#1F618D', '#F1C40F', '#27AE60', '#884EA0', '#D35400'],
        }]
      };

      const config = {
        type: 'pie',
        data: chartData,
        options: {
          plugins: {
            legend: {
              onHover: handleHover,
              onLeave: handleLeave
            }
          }
        }
      };

      new Chart(ctx, config);
    })
    .catch((error) => {
      console.error('Erro ao carregar os dados:', error);
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
  }
}
