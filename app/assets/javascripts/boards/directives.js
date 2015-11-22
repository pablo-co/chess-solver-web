var directives = angular.module('chess-solver.directives', []);

directives.directive('addPiece', ['$uibModal', function ($uibModal) {
    var directive = {
        restrict: 'A',
        scope: true,
        link: function ($scope, element, attrs) {
            element.bind('click', function (e) {
                e.preventDefault();

                $scope.active_place = attrs.addPiece;

                var modalInstance = $uibModal.open({
                    templateUrl: 'add-piece-modal',
                    controller: 'AddPieceModalCtrl'
                });

                modalInstance.result.then(function (result) {
                    result.y = parseInt($scope.active_place / 8);
                    result.x = $scope.active_place % 8;
                    $scope.places[$scope.active_place] = result;
                });

            });

        }
    };

    return directive;
}]);


directives.directive("square", function () {
    return {
        restrict: 'A',
        link: function (scope, element, attrs) {
            var width = element[0].offsetWidth;
            var height = element[0].offsetWidth;
            if (width < height) {
                element.css('width', height + 'px');
            } else {
                element.css('height', width + 'px');
            }
        }
    };
})