function s=species_name(x)
        switch x
            case 290
                s='mm';
            case 2805
                s='ce';
            case 5499
                s='sc';
            case 7518
                s='dm';
            case 9633
                s='hs';
            otherwise
                error('Species is not included in.');
        end

