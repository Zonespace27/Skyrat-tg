import { BooleanLike } from 'common/react';
import { useBackend } from '../backend';
import { Button, Section, LabeledList, Box, Dimmer } from '../components';
import { Window } from '../layouts';

type ClaimData = {
  name: string;
  reward_name: string;
  claim_location: string;
  claimed: BooleanLike;
};

type Data = {
  current_claims: ClaimData[];
};

export const RepoUplink = (props, context) => {
  const { act, data } = useBackend<Data>(context);
  const { current_claims } = data;

  return (
    <Window width={800} height={800} theme="syndicate">
      <Window.Content>
        <Section title="Claim List">
          {current_claims.map((claim) => (
            <Section title={claim.name}>
              {claim.claimed ? (
                <Box italics>{'Claim fufilled'}</Box>
              ) : (
                <>
                  {claim.claim_location
                    ? 'Dropoff Location: ' + claim.claim_location
                    : ''}
                  {claim.reward_name
                    ? 'Reward: ' + claim.reward_name
                    : 'Unknown Reward'}
                </>
              )}
            </Section>
          ))}
        </Section>
      </Window.Content>
    </Window>
  );
};
