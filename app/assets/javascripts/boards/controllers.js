var controllers = angular.module('chess-solver.controllers', []);

controllers.controller('ChessFormCtrl', ['$scope', function ($scope) {

    var initialize = function () {
        $scope.places = [];

        $scope.active_place = -1;

        for (var y = 0; y < 8; ++y) {
            for (var x = 0; x < 8; ++x) {
                $scope.places[y * 8 + x] = {x: x, y: y, kind: null, color: null, image: null};
            }
        }
    };

    initialize();
}]);

controllers.controller('ChessShowCtrl', ['$scope', function ($scope) {

    var initialize = function () {
        $scope.places = [];

        $scope.active_place = -1;


        for (var y = 0; y < 8; ++y) {
            for (var x = 0; x < 8; ++x) {
                $scope.places[y * 8 + x] = {x: x, y: y, kind: null, color: null, image: null};
            }
        }
    };

    $scope.$watch('pieces', function (newValue, oldValue) {
        angular.forEach($scope.pieces, function (piece, index) {
            $scope.places[piece.y * 8 + piece.x] = piece;
        });
    });

    initialize();
}]);


controllers.controller('PlayShowCtrl', ['$scope', function ($scope) {

    var initialize = function () {
        $scope.current_board = 0;

        $scope.places = [];
    };

    var resetPlaces = function () {
        for (var y = 0; y < 8; ++y) {
            for (var x = 0; x < 8; ++x) {
                $scope.places[y * 8 + x] = {x: x, y: y, kind: null, color: null, image: null};
            }
        }
    };

    $scope.nextBoard = function () {
        $scope.current_board++;
        normalizeBoard();
        drawBoard($scope.current_board);
    };

    $scope.previousBoard = function () {
        $scope.current_board--;
        normalizeBoard();
        drawBoard($scope.current_board);
    };

    var normalizeBoard = function () {
        if ($scope.current_board < 0) {
            $scope.current_board = 0;
        } else if ($scope.current_board >= $scope.boards.length - 1) {
            $scope.current_board = $scope.boards.length - 1;
        }
    };

    var drawBoard = function (index) {
        $scope.active_board = $scope.boards[index];
        resetPlaces();
        angular.forEach($scope.active_board.pieces, function (piece, index) {
            piece.image = $scope.images[piece.color][piece.kind];
            $scope.places[piece.y * 8 + piece.x] = piece;
        });
    };

    $scope.$watch('boards', function (newValue, oldValue) {
        drawBoard($scope.current_board);
    });

    initialize();
}]);

controllers.controller('AddPieceModalCtrl', ['$scope', '$uibModalInstance', function ($scope, $uibModalInstance) {

    var initialize = function () {
        $scope.errors = {};
    };

    $scope.accept = function (message) {
        $uibModalInstance.close();
    };

    $scope.cancel = function () {
        $uibModalInstance.close();
    };

    $scope.selectPiece = function (piece, color, image) {
        $uibModalInstance.close({kind: piece, color: color, image: image});
    };

    initialize();
}]);