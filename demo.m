

fprintf('Loading Features\n')
te = load ('test.mat');
tr = load ('train.mat');

% Feature Selection
train_set = tr.train(:,:);
test_set = te.test(:,:);
full_set = double([test_set;train_set]);

% Selecting face points to generate optimal feature subset
fprintf('POI Selected\n')
feature_idx = [1,3,4,6,7,9,10,12,13,16,17,20, 21,22,23, 27,29]

featureSubset = subsetSelection(full_set, feature_idx);

fprintf('Normalizing Features\n')
for i = 2 : size(featureSubset,2)
    featureSubset(:,i) = (featureSubset(:,i) - mean(featureSubset(:,i)))./(std(featureSubset(:,i)) + eps);
end

decision_val = [];
output_labels = [];
all_test_labels = featureSubset(:,1);
all_accuracy = zeros(1,10);
% Iteratively cross-validating each fold
for j = 1:10
    trainArray = zeros(size(train_set,1),size(featureSubset,2));
    testArray = zeros(size(test_set,1),size(featureSubset,2));
    fprintf('\nFold %d\n', j)
    for i = 1 : 10
        if i == j
            testArray(:,:) = featureSubset((600*(i-1))+1:600*(i),:);
        elseif i > j
            trainArray((600*(i-2))+1:600*(i-1),:) = featureSubset((600*(i-1))+1:600*(i),:);
        else
            trainArray((600*(i-1))+1:600*(i),:) = featureSubset((600*(i-1))+1:600*(i),:);
        end
    end
    train_features = trainArray(1,2:end);
    train_labels = trainArray(1,1);

    test_features = testArray(1,2:end);
    test_labels = testArray(1,1);

    % change cost of misclassification
    % e = The default parameter (-e 0.001) sets this value. 
    % The smaller the value is, the more accurate will the trained model be, 
    % but the more iterations will be taken.
    % c = cost
    % g = gamma
    fprintf('Training SVM...\n')
%     model = svmtrain(train_labels, train_features);
%     save('model.mat','model');
    load model.mat
    fprintf('Classifying the test data...\n')
    [predict_label, accuracy, prob_estimates] = svmpredict(test_labels, test_features, model);
end
