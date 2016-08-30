(function() {
  'use strict';

  angular
    .module('nqms')
    .controller('MeasuresController', measuresController);

  function measuresController($rootScope, $scope, $q, $state, $stateParams, security, moment, levelService, modalService, fixService, baseInfoService) {
    var vm = this;
    var getUserList = baseInfoService.getUserList(security.getUserinfo().role.deptCode);

    vm.rootScope = $rootScope;
    vm.formData = {};
    vm.scope = $scope;
    vm.resetForm = resetForm;
    vm.fillItem = fillItem;
    vm.del = del;
    vm.save = save;
    vm.load = {
      func: initData,
      init: true
    };

    initData();

    function initData() {
      getUserList.then(function (response) {
        if (response) {
          vm.userList = response;
        }
      });
      return getEventMeasures()
    }

    // 获取
    function getEventMeasures() {
      fixService.getEventMeasures({
        reportCode: $stateParams.reportCode
      }).then(function(response) {
        vm.measureList = response.data.data.lst;
      });
    }

    // 保存
    function save() {
        var data = angular.merge({}, vm.formData);

        angular.extend(data, {
          userCode: security.getUserinfo().user.userCode,
          reportCode: $stateParams.reportCode,
          meaTime: moment().format('YYYY-MM-DD HH:mm:ss')
        });
        // return;
        fixService.saveMeasure(data).then(function(response) {
          if (response && response.data.code === '0') {
            $rootScope.$broadcast('toast', {
              type: 'success',
              content: '保存成功！'
            });
            modalService.close('success');

            vm.load.func();
          }
        });
    }

    // 清空
    function resetForm() {
      vm.formData = {};
    }

    // 选中
    function fillItem(requirement) {
      vm.formData = angular.merge({}, requirement);
    }

    // 删除
    function del(params) {
      var _params;

          _params = {
            seqId: params.seqId
          };

      fixService['deleteRequirement'](_params).then(function(response) {
        if (response) {
          $rootScope.$broadcast('toast', {
            type: 'success',
            content: '已删除！'
          })

          vm.load.func();
        }
      });
    }
  }
})();