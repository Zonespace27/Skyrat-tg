import { BooleanLike } from 'common/react';
import { useBackend } from '../backend';
import { Button, Section } from '../components';
import { Window } from '../layouts';

type Data = {
  movespeed: number;
  range: number;
  moving: BooleanLike;
};

export const Timer = (props, context) => {
  const { act, data } = useBackend<Data>(context);
  //const { timing, loop } = data;

  return (
    <Window width={275} height={115}>
      <Window.Content>
        <Section title="Timing Unit"></Section>
      </Window.Content>
    </Window>
  );
};
