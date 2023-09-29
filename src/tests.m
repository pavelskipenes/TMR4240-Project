function [reference, wave] = tests(vessel_position)
  % TODO: refactor into loop maybe?
  reference, wave = simulation1(vessel_position)
  reference, wave = simulation2(vessel_position)
  reference, wave = simulation3(vessel_position)
  reference, wave = simulation4(vessel_position)
end

function ret = at_position(desired_position_ned, current_position_ned)
    treshold = 1; % TODO: needs to be tweaked
    if abs(current_position_ned - desired_position_ned) < treshold
        ret = true;
        return
    else
        ret = false;
    end
end

function reference = reference_model_naive(desired_position_ned, current_position_ned)
    if is_at_location(desired_position_ned, current_position_ned)
        reference = 0;
    else
        max_reference = 1; % TODO: needs to be tweaked
        % BUG: where referense is negative?
        % BUG: is the matrix positive or negative when not all elements in the matrix have the same signness?
        reference = min(current_position_ned - desired_position_ned, max_reference);
    end
end

% TODO: implement referense mode 1
% TODO: implement referense mode 2
function ret = is_steady_state(starting_position, current_position)
  persistent last_position
  last_position = starting_position;
  threshold = 0.1;
  if abs(last_position - current_position) < threshold
    ret = true;
    return
  end
  ret = false;
end

function referense, current = simulation1(current_position)
  positions = [
                [0 0 0]
  ];
    % TODO: current from north west with velocity of 0.5 m/s 
  current = [1 1 0];
end

function referense, wave = simulation4(current_position)
  persistent index
  positions = [
                [0 0 0]' [50 0 0]' [50 -50 0]' [50 -50 -pi/4]' [0 -50 -pi/4] [0 0 0]'
  ];

  % TODO: random current?
  index = 1;
  while (index ~= size(positions, 2) + 1)
    if ~at_position(positions(:,index), current_position) && ~is_steady_state(positions(:, index), current_position)
      referense = reference_model_naive(positions(:,1), current_position);
      % TODO: find a good way to swap between different referense models
      return
    end
    % destination and steady state reached. get new point
    index = index + 1;
  end
end
